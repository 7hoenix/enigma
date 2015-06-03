require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/calculate_offset'

class CalculateOffsetTest < MiniTest::Test

  def test_it_gets_an_offset_key_from_the_offset_class

    # For June 2nd 2015
    assert_equal 8225, CalculateOffset.calculate
  end

end
