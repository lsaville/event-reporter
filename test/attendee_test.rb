require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'

class AttendeeTest < Minitest::Test
  def test_it_exists
    sample = {first_name: "Lee", last_name: "Sabille", email_address: "l.w.slavile@gmail.com", homephone: "3036978278", street: "12923 s. Park place", city: "Globeville", state: "CO", zipcode: "80205", regdate: "some shit"}
    person = Attendee.new(sample)
    assert_equal Attendee, person.class
  end

  def test_gets_all_the_variables_right
    sample = {first_name: "Lee", last_name: "Sabille", email_address: "l.w.slavile@gmail.com", homephone: "3036978278", street: "12923 s. Park place", city: "Globeville", state: "CO", zipcode: "80205", regdate: "some shit"}
    person = Attendee.new(sample)

    assert_equal person.first_name, sample[:first_name]
    assert_equal person.last_name, sample[:last_name]
    assert_equal person.email, sample[:email_address]
    assert_equal person.phone, sample[:homephone]
    assert_equal person.street, sample[:street]
    assert_equal person.city, sample[:city]
    assert_equal person.state, sample[:state]
    assert_equal person.zipcode, sample[:zipcode]
    assert_equal person.reg_date, sample[:regdate]
  end
end
