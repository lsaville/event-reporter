class Que
  attr_accessor :que
  def initialize
    @que = []
  end

  def enque(thing)
    que << thing
  end

  def deque
    que.shift
  end

  def count
    que.length
  end

  def empty?
    que.empty?
  end

  def clear
    @que = []
  end
end
