require "./lib/character_map"

class Engine
  attr_reader :character_map

  def initialize
    @character_map = CharacterMap.new.map
  end

  def calculate(message, key, date_offset, decrypting)
    primary_keys = total_offset(key, date_offset)
    if decrypting
      primary_keys = primary_keys.map { |num| -num }
    end
    message_characters = message.strip.split("")
    slicer(primary_keys, message_characters)
  end

  def total_offset(key, date_offset)
    key_offsets = key.to_s.chars
    date_offsets = date_offset.to_s.split("")
    a = (key_offsets[0..1]).join.to_i + date_offsets[0].to_i
    b = (key_offsets[1..2]).join.to_i + date_offsets[1].to_i
    c = (key_offsets[2..3]).join.to_i + date_offsets[2].to_i
    d = (key_offsets[3..4]).join.to_i + date_offsets[3].to_i
    [a, b, c, d]
  end

  def slicer(primary_keys, message_characters)
    encrypted_message = []
    message_characters.each_slice(4) do |slice|
      slice.each_with_index do |char, index|
        encrypted_message << @character_map[(primary_keys[index]+@character_map.index(char)) % 39]
      end
    end
    encrypted_message.join
  end

end
