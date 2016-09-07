require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'

class AttendeeTest < Minitest::Test
  def test_it_exists
    person = Attendee.new
    assert_equal Attendee, person.class
  end

end
