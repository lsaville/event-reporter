require "minitest/autorun"
require "minitest/pride"
require "./lib/clean"

class CleanTest < Minitest::Test
  def test_it_exists
    clean = Clean.new

    assert_instance_of Clean, clean
  end

  def test_it_cleans_zipcodes
    clean = Clean.new

    assert_equal "00000", clean.zipcode(nil)
    assert_equal "00234", clean.zipcode("234")
    assert_equal "23820", clean.zipcode("23820-3032")
    assert_equal "00000", clean.zipcode("")
  end

  def test_it_cleans_phone_numbers
    clean = Clean.new

    assert_equal "3036978278", clean.phone("(303)6978278")
    assert_equal "9419792000", clean.phone("(941)979-2000")
    assert_equal "4018685000", clean.phone("14018685000")
    assert_equal "0000000000", clean.phone("9.82E+00")
    assert_equal "7782327000", clean.phone("778.232.7000")
    assert_equal "5309193000", clean.phone("530-919-3000")
    assert_equal "8584053000", clean.phone("858 405 3000")
  end

end
