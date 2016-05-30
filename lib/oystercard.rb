class Oystercard

attr_accessor :balance
attr_reader :in_journey

  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail "top up exceeds balance limit" if @balance + value > MAX_BALANCE
    @balance += value
  end

  def withdraw(value)
    @balance -= value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
  end

  def touch_out
  end
  
end
