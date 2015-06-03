class CalculateOffset

  def self.calculate
    date = Time.now
    formatted_date = date.strftime("%d%m%y")
    squared_date = formatted_date.to_i ** 2
    squared_date.to_s.split("").last(4).join.to_i
  end
end
