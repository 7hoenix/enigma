require "./test/test_helper"
require "./lib/character_map"

class CharacterMapTest < Minitest::Test
  def test_it_has_a_basic_character_map_by_default
    map = CharacterMap.new.map
    assert_equal [" ", ".", ","], map.last(3)
  end

  def test_it_can_accept_a_random_map
    random_map = ("A".."Z").to_a + ("0".."9").to_a + ("a".."z").to_a
    char_map = CharacterMap.new(random_map)

    map = char_map.map

    assert_equal 62, map.size
  end

end
