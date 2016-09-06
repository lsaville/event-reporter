require 'csv'
require './lib/clean'

class Attendees
  include Clean
  attr_reader :contents

  def load(file='event_attendees.csv')
    @contents = CSV.read file, headers: true, header_converters: :symbol
    clean(contents)
  end

  def clean(stuff)
    stuff.each do |row|
      row[:zipcode] = Clean.zipcode(row[:zipcode])
      row[:homephone] = Clean.phone(row[:homephone])
    end
  end
end
