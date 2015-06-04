require_relative 'engine'
require_relative 'crack_engine'
require_relative 'calculate_offset'

class Crack
  attr_reader :offset, :cracked_file, :encrypted_file

  def initialize( encrypted_file = nil, cracked_file = nil, date = 40615 )
    @encrypted_file = encrypted_file
    @cracked_file = cracked_file
    @offset = CalculateOffset.calculate(date)
  end

  def get_encrypted_message
    reader = File.open(encrypted_file, "r")
    encrypted_message = reader.readline
    reader.close
    crack_message(encrypted_message)
  end

  def crack_message(encrypted_message)
    engine = CrackEngine.new
    so_cracked = engine.crack(encrypted_message, offset)
    write_cracked_message(so_cracked[0])
  end

  def write_cracked_message(cracked_message)
    writer = File.open(cracked_file, "w")
    writer.write(cracked_message)
    writer.close
  end

end

if __FILE__ == $0
  crack = Crack.new(ARGV[0], ARGV[1], ARGV[2])
  crack.get_encrypted_message
  puts "Created #{ARGV[1]} with the cracked key: 12345 and a formatted date: #{ARGV[0]}"
end
