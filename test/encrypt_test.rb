require './test/test_helper'
require './lib/encrypt'
require './lib/engine'
require './lib/calculate_offset'
require './lib/generate_key'

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
    writer = File.open("./data/encrypted_test.txt", "w")

    writer.write("hello world ..end..")
    writer.close
    reader = File.open("./data/encrypted_test.txt", "r")

    assert_equal "hello world ..end..", reader.readline
  end

  def test_it_works
    encrypt = Encrypt.new
    original_file = "./data/message_test.txt"
    encrypted_file = "./data/encrypted_test.txt"
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
