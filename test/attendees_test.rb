require './test/test_helper'
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

    assert_equal Array, sample.attendees.class
    assert_equal 19, sample.attendees.length
    assert_equal Attendee, sample.attendees[0].class
  end

  def test_it_can_find_something
    sample = Attendees.new
    sample.load
    sample.find("zipcode", "98122")
    assert_equal 2, sample.q.count
  end

  def test_it_can_grab_district_info
    sample = Attendees.new
    sample.load
    sample.find("zipcode", "98122")
    sample.find_district

    assert_equal 7, sample.q.que[0].district
    assert_equal 7, sample.q.que[1].district
  end


end
