class CalculateOffset

  def self.calculate(formatted_date)
    formatted_date ||= self.formatted_date
    squared_date = formatted_date.to_i ** 2
    squared_date.to_s.split("").last(4).join.to_i
  end

  def self.formatted_date
    date = Time.now
    date.strftime("%e%m%y")
  end
end
