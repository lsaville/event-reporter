require 'minitest/autorun'
require 'minitest/pride'
require './lib/repl'

class ReplTest < Minitest::Test
  def test_it_exists
    repl = Repl.new
    assert_instance_of Repl, repl
  end

  def test_will_run
    repl = Repl.new

    assert_equal ["some", "shit"], repl.argv
  end
end
