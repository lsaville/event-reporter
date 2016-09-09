require './test/test_helper'
require './lib/repl'

class ReplTest < Minitest::Test
  def test_it_exists
    repl = Repl.new
    assert_instance_of Repl, repl
  end
end
