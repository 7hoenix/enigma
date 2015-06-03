class GenerateKey

  def self.generate
    temp_key = rand.to_s[2..6].to_i
    if temp_key.to_s.size == 5
      @key = temp_key
    else
      self.generate
    end
  end
end
