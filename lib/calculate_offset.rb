class CalculateOffset
  def initialize
    @date = Time.now
  end

  def calculate
    formatted_date = @date.strftime("%d%m%y")
    squared_date = formatted_date.to_i ** 2
    squared_date
  end
end
