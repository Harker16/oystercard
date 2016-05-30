class Oystercard

attr_accessor :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "top up exceeds balance limit" if @balance + value > MAX_BALANCE
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end

end
