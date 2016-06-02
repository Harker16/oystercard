require_relative 'journey'

class Oystercard

	attr_reader :balance, :journeys, :journey

	# There are three variables that need their values to be
  # readable. For this reason we used attribute reader.


	MAX_BALANCE = 90
  MIN_FARE = 1

  # Two constants are set at the start: the maximum balance that
  # can be stored on the card, and the minimum balance required
  # to use a train.

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

	# Method topup is created to allow money to be added to the
  # card. It's argument is the amount the user wants to add to
  # the card. The method will bring up an error if the user
  # enters an amount that exceeds the constant MAX_BALANCE.

  def in_journey?
  	journey ? true : false
  end

  # Method in_journey? is a true/false method for checking the
  # instance variable: journey. If a journey is in progress, it
  # will return true, if not - false. If a journey is not in 
  # progress then journey will equal nil and be false (journey is 
  # )

  def touch_in(station)
    fail 'insufficient balance' if balance < MIN_FARE
		if @journey
			deduct(@journey.fare)
			@journeys << journey.finish
		end
    @journey = Journey.new(station)
  end

  # 

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
