require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt'
require_relative '../lib/generate_key'
require_relative '../lib/calculate_offset'
require 'pry'

class DecryptTest < MiniTest::Test

  def test_it_has_a_key
    decrypt = Decrypt.new
    assert decrypt.key, "We got a key!"
  end

  def test_it_has_a_offset_calculated_with_todays_date
    decrypt = Decrypt.new

    assert decrypt.offset, "We got an offset!"
  end

  def test_it_can_read_an_encrypted_document
    reader = File.open("../lib/encrypted_test.txt", "r")

    assert_equal "gobbly gook", reader.readline
  end

  def test_it_can_write_to_a_document
    writer = File.open("../lib/decrypted_test.txt", "w")

    writer.write("crystal clear\n")

    writer.close

    reader = File.open("../lib/decrypted_test.txt", "r")

    assert_equal "crystal clear\n", reader.readline
  end

  def test_it_gets_a_deciphered_message_back_when_it_sends_key_offset_and_message_to_engine
    skip
    decrypt = Decrypt.new
    reader = File.open("../lib/decrypted_test.txt", "r")
    engine = Engine.new
    key = 12345
    offset = 8225
    decrypting = true
    message = reader.readline

    assert_equal "crystal clear\n", message



    assert_equal "blah blah", engine.calculate(message, key, offset, decrypting)

  end
  
end
