require 'minitest/autorun'
require 'minitest/pride'
require './lib/output'

class OutputTest < Minitest::Test

  def test_it_exists
    printer = Output.new
    assert_instance_of Output, printer
  end

  def test_initiates_with_kn
    skip
  end
end
