require 'minitest/autorun'
require 'minitest/pride'
require './lib/phrase'

class PhraseTest < Minitest::Test
  def test_it_exists
    phrase = Phrase.new
    assert_instance_of Phrase, phrase
  end

  # def test_help
  #   phrase = Phrase.new
  #   # require "pry"; binding.pry
  #   phrase = "Here are your choices:\nhelp\nload\nqueue count\nqueue clear\nqueue district\nqueue print\nqueue save to\nqueue export\nfind"
  #   assert_equal phrase, phrase.help
  # end
end
