require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/engine'

class EngineTest < MiniTest::Test

  def test_it_has_a_character_map
    engine = Engine.new

    assert engine.character_map
  end

  def test_it_has_a_character_map_array_in_the_proper_order_with_39_characters
    engine = Engine.new

    assert_equal 39, engine.character_map.size

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
                "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

    assert_equal expected, engine.character_map
  end

  def test_it_calculates_big_key_values_by_adding_keys_with_offsets
    engine = Engine.new
    key = 12345
    offset = 8225

    assert_equal [20, 25, 36, 50], engine.big_key(key, offset)
  end

  def test_it_uses_combined_keys_and_split_message_to_encrypt
    engine = Engine.new
    primary_keys = [20, 25, 36, 50]
    message_characters = ["h", "e", "l", "l"]

    assert_equal "13iw", engine.slicer(primary_keys, message_characters)
  end

  def test_it_rotates_short_string_in_the_message_by_the_associated_key
    engine = Engine.new
    key = 12345
    offset = 8225
    message = "hell\n"

    assert_equal "13iw", engine.calculate(message, key, offset)
  end

  def test_it_rotates_long_strings_in_the_message_by_the_associated_key
    engine = Engine.new
    key = 12345
    offset = 8225
    message = "hello world\n"

    assert_equal "13iw8wtz. a", engine.calculate(message, key, offset)
  end

end
