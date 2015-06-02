require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require_relative '../lib/generate_key'

# Make a char map array with all of our characters (a-z, 0-9, " ", ., ,)
# Call our key generator class to generate a key for us.
# Save that 5 digit key in a variable.
# Then we need to call our offset class to get the offset (which should just return 4 digits).
# Save that in a variable.

# In encrypt bring in the file to be encrypted.
# Split the file into an array of characters.
# Slice off 4 characters at a time from the file.
# Send the 4 characters, the key and the offset to an encrypt engine class
# Take the returned encoded characters and send them off to the file where we want to save them.

# return the key to the output terminal so that we can save it for decrypting.

class EncryptTest < Minitest::Test

  def test_it_has_a_character_map
    encrypt = Encrypt.new

    assert encrypt.character_map
  end

  def test_it_has_a_character_map_array_in_the_proper_order_with_39_characters
    encrypt = Encrypt.new

    assert_equal 39, encrypt.character_map.size

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
                "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]

    assert_equal expected, encrypt.character_map
  end

  def test_it_has_an_empty_encrypted_array_by_default
    encrypt = Encrypt.new

    assert encrypt.message.empty?
  end

  def test_it_takes_in_a_file_as_an_input
    skip
    encrypt = Encrypt.new
    unencrypted = File.open("encrypted.txt")

    encrypt.datum = unencrypted.read

    assert_equal "hello ..end..", encrypt.datum
  end

  def test_it_splits_the_file_into_an_array_of_characters
    skip
    encrypt = Encrypt.new
    unencrypted = File.open("encrypted.txt")

    encrypt.datum = unencrypted.read
    encrypt.splitted = encrypt.datum

    assert_equal ["h", "e", "l", "l", "o", " ", ".", ".", "e", "n", "d", ".", "."], encrypt.splitted
  end

  def test_it_sends_the_key_the_offset_and_the_4_characters_to_calculate_engine
    skip
  end

  def test_it_sends_the_characters_from_the_calculate_engine_to_the_encrypted_file
    skip
    encrypt = Encrypt.new
    unencrypted = File.open("encrypted.txt")
    e = EncryptEngine.new

    encrypt.datum = unencrypted.read
    encrypt.splitted = encrypt.datum


  end

  def test_it_returns_the_generated_key_to_the_terminal_so_we_can_use_it_decrypt
    skip
    encrypt = Encrypt.new
    generated_key = GenerateKey.new

    encrypt.key = generated_key

    assert_equal "12345", encrypt.done
  end
end
