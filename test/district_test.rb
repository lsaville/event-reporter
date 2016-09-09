require 'minitest/autorun'
require 'minitest/pride'
require './lib/district'

class DistrictTest < Minitest::Test
  def test_it_exists
    d = District.new
    assert_instance_of District, d
  end

  
end
