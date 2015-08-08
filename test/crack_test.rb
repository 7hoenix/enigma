require './test/test_helper'
require'./lib/crack'
require'./lib/calculate_offset'
require'./lib/engine'

class CrackTest < MiniTest::Test
  def test_it_has_an_offset
    cracker = Crack.new

    # For June 4th
    assert_equal 8225, cracker.offset
  end

  def test_it_can_read_from_a_document
    reader = File.open("./data/cracker_test.txt", "r")

    encrypted_message = reader.readline
    reader.close

    assert_equal "13iw8wtz. aisxbyxx8\n", encrypted_message
  end

  def test_it_works
    skip
    cracker = Crack.new
    encrypted_file = "./data/cracker_test.txt"
    cracked_file = "./data/cracked_test.txt"
    date = 30615
    offset = CalculateOffset.calculate(date)

    assert cracker.offset

    reader = File.open(encrypted_file, "r")
    encrypted_message = reader.readline

    crack_engine = CrackEngine.new
    cracked_message, cracked_key = crack_engine.crack(encrypted_message, offset)
    assert_equal "hello world ..end..", cracked_message

    assert_equal 12345, cracked_key
  end

end
