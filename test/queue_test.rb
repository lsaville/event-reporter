require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test
  def test_it_exists
    q = Queue.new
    assert_instance_of Queue, q
  end

  def test_it_initializes_with_an_empty_array
    q = Queue.new
    assert_equal [], q.queue
  end

  def test_it_can_hold_stuff
    q = Queue.new
    q.enqueue("stuff")
    assert_equal ["stuff"], q.queue

    q.enqueue("more stuff")
    assert_equal ["stuff", "more stuff"], q.queue
  end

  def test_it_can_dequeue
    q = Queue.new
    q.enqueue("stuff")
    q.enqueue("more stuff")
    q.enqueue("even more stuff")


    assert_equal "stuff", q.dequeue
    assert_equal "more stuff", q.dequeue
    assert_equal "even more stuff", q.dequeue
  end

  def test_it_can_tell_you_count
    q = Queue.new
    q.enqueue("stuff")
    q.enqueue("more stuff")
    q.enqueue("even more stuff")

    assert_equal 3, q.count

    q.dequeue
    assert_equal 2, q.count

    q.dequeue
    assert_equal 1, q.count

    q.dequeue
    assert_equal 0, q.count 
  end

  def test_can_tell_if_empty
    q = Queue.new
    q.enqueue("stuff")
    q.enqueue("more stuff")
    q.enqueue("even more stuff")

    refute q.empty?

    3.times { q.dequeue }

    assert q.empty?
  end

  def test_it_can_clear
    q = Queue.new
    q.enqueue("stuff")
    q.enqueue("more stuff")
    q.enqueue("even more stuff")

    refute q.empty?
    assert_equal [], q.clear
    assert q.empty?
  end
end
