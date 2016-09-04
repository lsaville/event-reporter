class Queue
  attr_reader :queue
  def initialize
    @queue = []
  end

  def enqueue(thing)
    @queue << thing
  end
end
