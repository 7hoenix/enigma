class CharacterMap
  attr_reader :map

  def initialize( map = [] )
    if map.empty?
      @map = ("a".."z").to_a + ("0".."9").to_a + [" ", ".", ","]
    else
      @map = map
    end
  end

end

