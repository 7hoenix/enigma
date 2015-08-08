require_relative '../lib/generate_key'
require_relative '../lib/calculate_offset'
require_relative '../lib/engine'

class Decrypt
  attr_reader :decrypted_file, :offset, :key, :encrypted_file, :decrypting

  def initialize( encrypted_file = nil, decrypted_file = nil, key = 12345, date = 8225 )
    @encrypted_file = encrypted_file
    @decrypted_file = decrypted_file
    @key = key
    @offset = CalculateOffset.calculate(date)
    @decrypting = true
  end

  def get_encrypted_message
    reader = File.open(encrypted_file, "r")
    encrypted_message = reader.readline
    reader.close
    decrypt_message(encrypted_message)
  end

  def decrypt_message(encrypted_message)
    engine = Engine.new
    decrypted_message = engine.calculate(encrypted_message, key, offset, decrypting)
    write_decrypted_message(decrypted_message)
  end

  def write_decrypted_message(decrypted_message)
    writer = File.open(decrypted_file, "w")
    writer.write(decrypted_message)
  end

end

if __FILE__ == $0
  decrypt = Decrypt.new(ARGV[0], ARGV[1], ARGV[2], ARGV[3])
  decrypt.get_encrypted_message
  puts "Created #{ARGV[1]} with the key #{ARGV[2]} and a formatted date: #{ARGV[3]}"
end
