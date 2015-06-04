require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack'
require_relative '../lib/calculate_offset'
require_relative '../lib/engine'

# ruby./ lib/crack.rb encrypted.txt cracked.txt 030415
# takes in a file and a file to output it to and a date

class CrackTest < MiniTest::Test
  def test_it_has_an_offset
    cracker = Crack.new

    # For June 4th
    assert_equal 8225, cracker.offset
  end

  def test_it_can_read_from_a_document
    reader = File.open("../lib/cracker_test.txt", "r")

    encrypted_message = reader.readline
    reader.close

    assert_equal "13iw8wtz. aisxbyxx8\n", encrypted_message
  end

  def test_it_works
    cracker = Crack.new
    encrypted_file = "../lib/cracker_test.txt"
    cracked_file = "../lib/cracked_test.txt"
    date = 30615
    offset = CalculateOffset.calculate(date)

    assert cracker.offset

    reader = File.open(encrypted_file, "r")
    encrypted_message = reader.readline

    cracked_message, cracked_key = engine.crack(encrypted_message, offset)
    assert_equal "hello world ..end..", cracked_message

    assert_equal 12345, cracked_key
  end

end
