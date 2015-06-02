require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/calculate_offset'

class CalculateOffsetTest < Minitest::Test

  def test_it_gets_an_offset_key_from_the_offset_class
    calculated_offset = CalculateOffset.new

    # For June 2nd 2015
    assert_equal 8225, calculated_offset.calculate
  end

end
