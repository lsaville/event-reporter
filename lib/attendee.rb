require './lib/clean'

class Attendee
  include Clean
  attr_reader :first_name, :last_name, :email, :phone, :street, :city, :state, :zipcode, :reg_date, :district
  def initialize(row)
    @first_name = Clean.name(row[:first_name])
    @last_name = Clean.name(row[:last_name])
    @email = row[:email_address]
    @phone = Clean.phone(row[:homephone])
    @street = row[:street]
    @city = row[:city]
    @state = row[:state]
    @zipcode = Clean.zipcode(row[:zipcode])
    @reg_date = row[:regdate]
    @district = ""
  end
end
