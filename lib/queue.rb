class Queue
  attr_accessor :queue
  def initialize
    @queue = []
  end

  def enqueue(thing)
    queue << thing
  end

  def dequeue
    queue.shift
  end

  def count
    queue.length
  end

  def empty?
    queue.empty?
  end

  def clear
    @queue = []
  end
end
