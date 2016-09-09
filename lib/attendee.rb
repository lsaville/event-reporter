require './lib/clean'

class Attendee
  include Clean
  attr_accessor :district
  attr_reader :first_name, :last_name, :email, :phone, :street, :city, :state, :zipcode, :reg_date
  def initialize(row)
    @first_name = Clean.name(row[:first_name])
    @last_name = Clean.name(row[:last_name])
    @email = Clean.thing(row[:email_address])
    @phone = Clean.phone(row[:homephone])
    @street = Clean.thing(row[:street])
    @city = Clean.thing(row[:city])
    @state = Clean.thing(row[:state])
    @zipcode = Clean.zipcode(row[:zipcode])
    @reg_date = Clean.thing(row[:regdate])
    @district = ""
  end
end
