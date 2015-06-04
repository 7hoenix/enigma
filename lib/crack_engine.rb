require_relative 'engine'

class CrackEngine
  attr_accessor :cracked
  attr_reader :decrypting

  def initialize
    @decrypting = true
    @cracked = false
  end

  def crack(encrypted_message, offset)
    #control = calculate_control(encrypted_message)
    cracker(encrypted_message, offset)
  end

  def cracker(encrypted_message, offset)
    cracked_key = 10000
    until cracked
      standard_engine = Engine.new
      decrypted_message = standard_engine.calculate(encrypted_message, cracked_key, offset, decrypting)
      cracked = true if decrypted_message.split[-7,-1] == "..end.."
      cracked_key += 1
    end
    cracked_key
  end
end
