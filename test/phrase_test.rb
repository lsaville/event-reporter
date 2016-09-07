require 'minitest/autorun'
require 'minitest/pride'
require './lib/phrase'

class PhraseTest < Minitest::Test
  def test_it_exists
    p = Phrase.new
    assert_instance_of Phrase, p
  end
end
