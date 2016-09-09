require './test/test_helper'
require './lib/district'
require './lib/attendee'

class DistrictTest < Minitest::Test
  def test_it_exists
    d = District.new
    assert_instance_of District, d
  end

  def test_simulated_attendee
    d = District.new
    sample1 = {first_name: "Lee", last_name: "Sabille", email_address: "l.w.slavile@gmail.com", homephone: "3036978278", street: "12923 s. Park place", city: "Globeville", state: "CO", zipcode: "80205", regdate: "some shit"}
    sample2 = {first_name: "Rachel", last_name: "Farland", email_address: "rachie.pants@gmail.com", homephone: "303", street: "70021 east broadmoor", city: "Distancia", state: "KS", zipcode: "80433", regdate: "some mo shit"}
    persons = [Attendee.new(sample2), Attendee.new(sample1)]

    d.find_district(persons)
    assert_equal 2, persons[0].district
    assert_equal 1, persons[1].district
  end

end
