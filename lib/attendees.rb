require './lib/clean'
require './lib/que'
require './lib/attendee'
require './lib/print'
require 'csv'
require 'open-uri'
require 'json'

class Attendees
  include Clean
  attr_reader :contents, :q, :attendees, :print
  def initialize
    @q = Que.new
    @p = Print.new
  end

  def load(file='event_attendees.csv')
    @contents = CSV.read file, headers: true, header_converters: :symbol
    assign_attendees
  end

  def assign_attendees
    @attendees = @contents.map do |row|
      Attendee.new(row)
    end
  end

  def find(attribute, criteria)
    @q.clear
    @attendees.each do |attendee|
      @q.enque(attendee) if attendee.send(attribute) == criteria
    end
  end

  def find_district
    @q.que.each do |attendee|
      zipcode = attendee.zipcode
      url = "https://congress.api.sunlightfoundation.com/districts/locate?zip=#{zipcode}&apikey=3321d49851c347e284a0c20c2c73f2d4"
      data = JSON.parse(open(url).read)
      attendee.district = data["results"][0]["district"]
    end
    require "pry"; binding.pry
  end

  def print
    @p.people(q.que)
  end

  def print_by
  end

end
example = Attendees.new
example.load
example.find("zipcode", "98122")
example.find_district
# require "pry"; binding.pry
example.print
