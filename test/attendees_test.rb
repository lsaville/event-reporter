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

end
