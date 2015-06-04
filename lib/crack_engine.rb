require_relative 'engine'
require 'pry'

class CrackEngine
  attr_accessor :cracked
  attr_reader :decrypting

  def initialize
    @decrypting = true
    @cracked = false
  end

  def crack(encrypted_message, offset)
    cracker(encrypted_message, offset)
  end

  def cracker(encrypted_message, offset)
    cracked_key = "00000"
    until cracked
      standard_engine = Engine.new
      decrypted_message = standard_engine.calculate(encrypted_message, cracked_key, offset, decrypting)
      decrypted_message_array = decrypted_message.split("")
      piece = decrypted_message_array[-7..-1]
      cracked = true if piece.join == "..end.."
      cracked_key = cracked_key.to_i
      cracked_key += 1
      cracked_key = sprintf("%05d", cracked_key)
    end
    so_cracked = [decrypted_message, cracked_key]
  end
end
