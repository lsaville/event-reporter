require 'csv'
require './lib/clean'
require './lib/que'
require './lib/attendee'

class Attendees
  include Clean
  attr_reader :contents, :q, :attendees
  def initialize
    @q = Que.new
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

end
# example = Attendees.new
# example.load
# example.assign_attendees
# require "pry"; binding.pry
# puts example.attendees
