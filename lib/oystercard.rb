class Oystercard

attr_accessor :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "top up exceeds balance limit" if @balance + value > 90
    @balance += value
  end

end
