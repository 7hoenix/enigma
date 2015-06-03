require_relative '../lib/generate_key'
require_relative '../lib/calculate_offset'
require_relative '../lib/engine'

class Encrypt
  attr_reader :key, :offset, :file_to_read, :file_to_write

  def initialize(file_to_read, file_to_write)
    @file_to_read = file_to_read
    @file_to_write = file_to_write
    @key = GenerateKey.generate
    @offset = CalculateOffset.calculate
  end

  def write_encrypted_message(encrypted_message)
    writer = File.open("#{file_to_write}", "w")
    writer.write(encrypted_message)
    writer.close
  end

  def get_encrypted_message(message)
    engine = Engine.new
    encrypted_message = engine.calculate(message, key, offset)
    write_encrypted_message(encrypted_message)
  end

  def get_message
    reader = File.open("#{file_to_read}", "r")
    message = reader.readline
    reader.close
    get_encrypted_message(message)
  end
end

if __FILE__ == $0
  encrypt = Encrypt.new(ARGV[0], ARGV[1])
  encrypt.get_message
  puts "Created #{ARGV[0]} with the key #{encrypt.key} and date #{Time.now}"
end
