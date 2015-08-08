require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/calculate_offset'

class CalculateOffsetTest < MiniTest::Test

  def test_it_gets_an_offset_key_from_the_offset_class
    date = nil
    # For June 2nd 2015
    assert_equal 4225, CalculateOffset.calculate(date)
  end

end
