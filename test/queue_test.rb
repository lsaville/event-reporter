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

    assert_equal [], q.q
  end
end
