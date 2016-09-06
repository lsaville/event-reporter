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

  def test_find_can_find_something
    sample = Attendees.new
    sample.load
    result1 = [" 14,11/16/08 13:54,Laura,Rapetsky,ikr08@jumpstartlab.com,7872950000,Urb Monte Carlo c/15#1287,San Juan,PR,00924"]
    result2 = [" 17,11/19/08 21:56,Shannon,Davis,ltb3@jumpstartlab.com,5303557000,Campion 1108 914 E. Jefferson,Seattle,WA,98122",
 " 18,11/20/08 16:25,Nash,Okaty,qdansonlm@jumpstartlab.com,2062263000,914 E Jefferson ST,Seattle,WA,98122"]

    assert_equal result1, sample.find("zipcode", "00924")
    assert_equal result2, sample.find("zipcode", "98122")
  end

end
