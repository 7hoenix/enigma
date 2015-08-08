require './test/test_helper'
require './lib/decrypt'
require './lib/generate_key'
require './lib/calculate_offset'
require './lib/character_map'

class DecryptTest < MiniTest::Test

  def test_it_has_a_key
    decrypt = Decrypt.new
    assert decrypt.key, "We got a key!"
  end

  def test_it_has_a_offset_calculated_with_todays_date
    decrypt = Decrypt.new

    assert decrypt.offset, "We got an offset!"
  end

  def test_it_can_write_to_a_document
    writer = File.open("./data/decrypted_test.txt", "w")

    writer.write("hello world ..end..\n")

    writer.close

    reader = File.open("./data/decrypted_test.txt", "r")

    assert_equal "hello world ..end..\n", reader.readline
  end

  def test_it_works
    skip
    decrypt = Decrypt.new
    encrypted_file = "./data/encrypted_test.txt"
    decrypted_file = "./data/decrypted_test.txt"
    key = 12345
    decrypting = true

    assert decrypt.key
    assert decrypt.offset
    assert decrypt.decrypting

    reader = File.open(encrypted_file, "r")
    encrypted_message = reader.readline
    reader.close

    assert_equal "13iw8wtz. aisxbyxx8", encrypted_message

    engine = Engine.new
    decrypted_message = engine.calculate(encrypted_message, key, offset, decrypting)
    assert_equal "hello world ..end..", decrypted_message

    writer = File.open(decrypted_file, "w")
    writer.write(decrypted_message)
    writer.close
  end
end
