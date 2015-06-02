class GenerateKey
  attr_reader :key

  def initialize(key=12345)
    @key = key
  end

  def generate
    @key = rand.to_s[2..6].to_i
  end
end
