require_relative 'journey'
require_relative 'journeylog'
require_relative 'station'
class Oystercard

	MAX_BALANCE = 90
  MIN_FARE = 1

	attr_reader :balance, :journeys

	def initialize
		@balance = 0
    @journeys = []
    @journey
		#@journeys = JourneyLog.new
	end


	def touch_in(station)
    fail "Not enough credit" unless enough_credit?
		#@journeys.start(station)
    @journey = Journey.new(station)
	end

	def touch_out(exit_station)
    @journey.end(exit_station)
    @journeys << @journey.current_journey
    deduct
	end

	def top_up(amount)
		fail "Can't top up over £#{MAX_BALANCE}" if exceeded_max? amount
		@balance += amount
	end

  private
  def exceeded_max?(amount)
    (balance + amount) > MAX_BALANCE
  end

  def deduct
    @balance -= @journey.fare
  end

  def enough_credit?
    balance >= MIN_FARE
  end

end
