require 'pry'

class Engine
  attr_reader :character_map

  def initialize
    @character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
                      "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end

  def calculate(message, key, offset, decrypting)
    primary_keys = big_key(key, offset)
    if decrypting
      primary_keys = primary_keys.map { |num| -num }
    end
    message_characters = message.strip.split("")
    slicer(primary_keys, message_characters)
  end

  def big_key(key, offset)
    keys = key.to_s.split("")
    offsets = offset.to_s.split("")
    a = (keys[0] + keys[1]).to_i + offsets[0].to_i
    b = (keys[1] + keys[2]).to_i + offsets[1].to_i
    c = (keys[2] + keys[3]).to_i + offsets[2].to_i
    d = (keys[3] + keys[4]).to_i + offsets[3].to_i
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

  def crack(encrypted_message, offset)
    
    cracked_message, cracked_key = # Insert super smart code here
  end

end
