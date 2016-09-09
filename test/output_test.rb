require './test/test_helper'
require './lib/output'
require './lib/attendee'

class OutputTest < Minitest::Test

  def test_it_exists
    printer = Output.new
    assert_instance_of Output, printer
  end

  def test_people
    printer = Output.new
    sample1 = {first_name: "Lee", last_name: "Sabille", email_address: "l.w.slavile@gmail.com", homephone: "3036978278", street: "12923 s. Park place", city: "Globeville", state: "CO", zipcode: "80205", regdate: "some shit"}
    person = [Attendee.new(sample1)]

    printer.people(person)
  end

  def test_people_by
    printer = Output.new
    sample1 = {first_name: "Lee", last_name: "Sabille", email_address: "l.w.slavile@gmail.com", homephone: "3036978278", street: "12923 s. Park place", city: "Globeville", state: "CO", zipcode: "80205", regdate: "some shit"}
    sample2 = {first_name: "Rachel", last_name: "Farland", email_address: "rachie.pants@gmail.com", homephone: "303", street: "70021 east broadmoor", city: "Distancia", state: "KS", zipcode: "53892", regdate: "some mo shit"}
    persons = [Attendee.new(sample2), Attendee.new(sample1)]

    printer.people_by(persons, "first_name")
  end
end
