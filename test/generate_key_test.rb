require 'minitest/autorun'
require 'minitest/pride'
require '../lib/generate_key'

class GenerateKeyTest < Minitest::Test

  def test_it_gets_a_key_generated_from_the_generate_class
    generator = GenerateKey.new

    generated_key = generator.generate

    assert_equal 12345, generated_key
  end

end
