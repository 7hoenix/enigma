require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack_engine'

class CrackEngineTest < MiniTest::Test
  def test_it_has_a_character_map
    skip
    engine = CrackEngine.new
    
    assert engine.character_map
  end

  def test_it_has_character_map_array_in_the_proper_order_with_39_characters
    skip
    engine = CrackEngine.new
    
    assert_equal 39, engine.character_map.size
    
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
                "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    
    assert_equal expected, engine.character_map
  end

  def test_it_finds__4_characters_of_the_message_to_test_against_the_control
    engine = CrackEngine.new
    encrypted_message = "13iw8wtz. aisxbyxx8"

    control = engine.calculate_control(encrypted_message)

    assert_equal "sxby", control
  end

  def test_it_iterates_through_all_potential_keys_testing_against_the_control_and_offset_values_to_calculate_cracked_key
   skip
    engine = CrackEngine.new
    offset = 8225
    control = "yxx8"

    cracked_key = engine.cracker(control, offset)

    assert_equal 12345, cracked_key
  end

  def test_it_works
    engine = CrackEngine.new
    offset = 8225
    encrypted_message = "13iw8wtz. aisxbyxx8"

    cracked_key = engine.cracker(encrypted_message, offset)

    assert_equal 12345, cracked_key
  end
end
