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
end
