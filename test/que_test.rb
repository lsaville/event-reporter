require 'minitest/autorun'
require 'minitest/pride'
require './lib/que'

class QueTest < Minitest::Test
  def test_it_exists
    q = Que.new
    assert_instance_of Que, q
  end

  def test_it_initializes_with_an_empty_array
    q = Que.new
    assert_equal [], q.que
  end

  def test_it_can_hold_stuff
    q = Que.new
    q.enque("stuff")
    assert_equal ["stuff"], q.que

    q.enque("more stuff")
    assert_equal ["stuff", "more stuff"], q.que
  end

  def test_it_can_deque
    q = Que.new
    q.enque("stuff")
    q.enque("more stuff")
    q.enque("even more stuff")


    assert_equal "stuff", q.deque
    assert_equal "more stuff", q.deque
    assert_equal "even more stuff", q.deque
  end

  def test_it_can_tell_you_count
    q = Que.new
    q.enque("stuff")
    q.enque("more stuff")
    q.enque("even more stuff")

    assert_equal 3, q.count

    q.deque
    assert_equal 2, q.count

    q.deque
    assert_equal 1, q.count

    q.deque
    assert_equal 0, q.count
  end

  def test_can_tell_if_empty
    q = Que.new
    q.enque("stuff")
    q.enque("more stuff")
    q.enque("even more stuff")

    refute q.empty?

    3.times { q.deque }

    assert q.empty?
  end

  def test_it_can_clear
    q = Que.new
    q.enque("stuff")
    q.enque("more stuff")
    q.enque("even more stuff")

    refute q.empty?
    assert_equal [], q.clear
    assert q.empty?
  end
end
