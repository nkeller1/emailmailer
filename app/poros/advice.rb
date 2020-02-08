class Advice
  def initialize(advice_data)
    @advice_data = advice_data
  end

  def message
    @advice_data[:slip][:advice]
  end
end
