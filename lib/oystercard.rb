require_relative 'journey'

class Oystercard

	attr_reader :balance, :journeys, :journey

	# There are three variables that need to have their values
	# referred to. For this reason we used attribute reader.


	MAX_BALANCE = 90
  MIN_FARE = 1

	def initialize
		@balance = 0
		@in_journey = false
		@journeys = []
		@journey = nil
	end

	# On initialization of new instance of Oystercard, balance
	# is set to zero for obvious reasons. @in_journey is set to
	# false because no journey has yet to begin. #journeys is
	# empty because no jouneys have occured yet to be recorded.
	# @journey is set to nil

	def topup(value)
    fail "Balance exceeded limit of #{MAX_BALANCE}" if (balance + value) > MAX_BALANCE
		@balance += value
	end

	# 

  def in_journey?
  	journey ? true : false
  end

  def touch_in(station)
    fail 'insufficient balance' if balance < MIN_FARE
		if @journey
			deduct(@journey.fare)
			@journeys << journey.finish
		end
    @journey = Journey.new(station)
  end

  def touch_out(station)
		@journey = Journey.new if @journey == nil
    @journeys << @journey.finish(station)
		deduct(@journey.fare)
		@journey = nil
  end

	  private

	  def deduct(value)
	    @balance -= value
	  end

end
