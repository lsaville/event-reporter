require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendees'

class AttendeesTest < Minitest::Test
  def test_it_exists
    sample = Attendees.new
    assert_instance_of Attendees, sample
  end

  def test_takes_file
    sample = Attendees.new
    sample.load('event_attendees.csv')
    assert_equal CSV::Table, sample.contents.class
  end

  def test_load_defaults_to_event_attendees
    sample = Attendees.new
    sample.load
    assert_equal CSV::Table, sample.contents.class
  end

  def test_attendees_is_an_array_with_attendee_objects
    sample = Attendees.new
    sample.load
    sample.assign_attendees

    assert_equal Array, sample.attendees.class
    assert_equal 19, sample.attendees.length
    assert_equal Attendee, sample.attendees[0].class
  end

  def test_it_can_find_something
    sample = Attendees.new
    require "pry"; binding.pry
    sample.load
    sample.assign_attendees
    sample.find("zipcode", "98122")
    assert_equal 2, sample.results.length
  end

end
