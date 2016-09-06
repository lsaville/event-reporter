require 'csv'
require './lib/clean'
require './lib/queue'

class Attendees < Queue
  include Clean
  attr_reader :contents

  def load(file='event_attendees.csv')
    @contents = CSV.read file, headers: true, header_converters: :symbol
    clean(contents)
  end

  def find(attribute, criteria)
    attribute = attribute.to_sym
    results = []
    contents.each do |row|
      results << row.to_s.chomp if row[attribute] == criteria
    end
    return results
  end

  def clean(stuff)
    stuff.each do |row|
      row[:zipcode] = Clean.zipcode(row[:zipcode])
      row[:homephone] = Clean.phone(row[:homephone])
      row[:first_name] = Clean.name(row[:first_name])
      row[:last_name] = Clean.name(row[:last_name])
    end
  end
end
