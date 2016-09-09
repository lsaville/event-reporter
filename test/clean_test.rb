require "minitest/autorun"
require "minitest/pride"
require "./lib/clean"

class CleanTest < Minitest::Test
  def test_it_cleans_zipcodes
    assert_equal "00000", Clean.zipcode(nil)
    assert_equal "00234", Clean.zipcode("234")
    assert_equal "23820", Clean.zipcode("23820-3032")
    assert_equal "00000", Clean.zipcode("")
  end

  def test_it_cleans_phone_numbers
    assert_equal "3036978278", Clean.phone("(303)6978278")
    assert_equal "9419792000", Clean.phone("(941)979-2000")
    assert_equal "4018685000", Clean.phone("14018685000")
    assert_equal "0000000000", Clean.phone("9.82E+00")
    assert_equal "7782327000", Clean.phone("778.232.7000")
    assert_equal "5309193000", Clean.phone("530-919-3000")
    assert_equal "8584053000", Clean.phone("858 405 3000")
    assert_equal "0000000000", Clean.phone(nil)
  end

  def test_it_cleans_names
    assert_equal "Mary", Clean.name("  Mary")
    assert_equal "Mary", Clean.name("Mary     ")
    assert_equal "Mary", Clean.name("   Mary   ")
    assert_equal "", Clean.name(nil)
  end

  def test_it_cleans_nils
    assert_equal "", Clean.thing(nil)
  end
end
