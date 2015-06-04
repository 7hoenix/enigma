require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt'
require_relative '../lib/engine'
require_relative '../lib/calculate_offset'
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

class EncryptTest < MiniTest::Test

  def test_it_has_a_key
    mock_key = MiniTest::Mock.new
    mock_key.expect :key, 12345

    Encrypt.stub :new, mock_key do
      encrypt = Encrypt.new
      assert_equal 12345, encrypt.key
    end

    refute_equal 12345, Encrypt.new.key
  end

  def test_it_has_an_offset_value
    date = 30615
    # For June 4th 2015
    assert_equal 8225, CalculateOffset.calculate(date)
  end

  def test_it_sends_the_characters_from_the_calculate_engine_to_the_encrypted_file
    writer = File.open("../lib/encrypted_test.txt", "w")

    writer.write("hello world ..end..")
    writer.close
    reader = File.open("../lib/encrypted_test.txt", "r")

    assert_equal "hello world ..end..", reader.readline
  end

  def test_it_works
    encrypt = Encrypt.new
    original_file = "../lib/message_test.txt"
    encrypted_file = "../lib/encrypted_test.txt"
    key = 12345
    offset = 8225
    decrypting = false

    assert encrypt.key
    assert encrypt.offset
    #assert encrypt.decrypting, "Should be false"

    reader = File.open(original_file, "r")
    original_message = reader.readline
    reader.close

    assert_equal "hello world ..end..\n", original_message

    engine = Engine.new
    encrypted_message = engine.calculate(original_message, key, offset, decrypting)
    assert_equal "13iw8wtz. aisxbyxx8", encrypted_message

    writer = File.open(encrypted_file, "w")
    writer.write(encrypted_message)
    writer.close

    reader = File.open(encrypted_file, "r")
    encrypted_message_check = reader.readline
    reader.close
    assert_equal "13iw8wtz. aisxbyxx8", encrypted_message_check
  end

end
