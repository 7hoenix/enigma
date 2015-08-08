require 'minitest/autorun'
require 'minitest/pride'
require './lib/generate_key'

class GenerateKeyTest < Minitest::Test

  def test_it_gets_a_key_generated_from_the_generate_class
    keys = []
    1000.times do
      keys << GenerateKey.generate
    end
    expected = keys.size - keys.uniq.size <= 10
    assert expected, "The difference between the two key sizes is: #{keys.size - keys.uniq.size}"
  end
end
