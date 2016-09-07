require 'minitest/autorun'
require 'minitest/pride'
require './lib/print'

class PrintTest < Minitest::Test

  def test_it_exists
    printer = Print.new
    assert_instance_of Print, printer
  end

  def test_initiates_with_kn
end
