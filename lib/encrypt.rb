require_relative '../lib/generate_key'

class Encrypt
  attr_reader :key, :offset

  def initialize
    @key = GenerateKey.generate
    @offset = CalculateOffset.calculate
  end

  def get_message
    reader = File.open("message.txt")
    message = reader.read
    parser(message)
  end

  def parser(message)
    message.split(//)
  end

end
