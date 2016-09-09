require 'minitest/autorun'
require 'minitest/pride'
require './lib/phrase'

class PhraseTest < Minitest::Test
  def test_it_exists
    phrase = Phrase.new
    assert_instance_of Phrase, phrase
  end
end
