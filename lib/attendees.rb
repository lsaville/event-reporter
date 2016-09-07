require 'csv'
require './lib/clean'
require './lib/queue'
require './lib/attendee'

class Attendees
  include Clean
  attr_reader :contents, :q, :attendees
  def intitialize
    @q = Queue.new
  end

  def load(file='event_attendees.csv')
    @contents = CSV.read file, headers: true, header_converters: :symbol
  end

  def assign_attendees
    @attendees = @contents.map do |row|
      Attendee.new(row)
    end
  end

  def find(attribute, criteria)
    @attendees.each do |attendee|
      @q.enqueue(attendee) if attendee.send(attribute) == criteria
    end
  end

end
# example = Attendees.new
# example.load
# example.assign_attendees
# # require "pry"; binding.pry
# puts example.attendees


# def clean(stuff)
#   stuff.each do |row|
#     row[:zipcode] = Clean.zipcode(row[:zipcode])
#     row[:homephone] = Clean.phone(row[:homephone])
#     row[:first_name] = Clean.name(row[:first_name])
#     row[:last_name] = Clean.name(row[:last_name])
#   end
# end
