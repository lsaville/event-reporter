require './lib/clean'
require './lib/que'
require './lib/attendee'
require './lib/output'
require './lib/district'
require 'csv'
require 'open-uri'
require 'json'

class Attendees
  include Clean
  attr_reader :contents, :q, :attendees, :print
  def initialize
    @q = Que.new
    @output = Output.new
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
      @q.enque(attendee) if attendee.send(attribute).upcase == criteria.upcase
    end
  end

  def find_district
    district = District.new
    district.find_district(q.que)
  end

  def print
    @output.people(q.que)
  end

  def print_by(attribute)
    @output.people_by(q.que, attribute)
  end

  def output_html(filename)
    @output.html(q.que, filename)
  end

  def output_csv(filename)
    @output.csv(q.que, filename)
  end

end
# example = Attendees.new
# example.load
# example.find("zipcode", "98122")
# example.find_district
# require "pry"; binding.pry
# example.print
# example.print_by("first_name")
