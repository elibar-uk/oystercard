require_relative 'journey'

class JourneyLog

  attr_reader :journey_history, :current_journey

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey
    @journey_history = []

  end

  def start(entry_station)
    @current_journey = @journey_class.new(entry_station)
    @journey_history << @current_journey
  end

  def finish(exit_station)
    @current_journey.end(exit_station)
    @current_journey = nil
  end

  def journeys
    @journey_history.dup
  end

  private

  # def current_journey
  #   #if the current journey is incomplete, return it (add it to the journey_history)
  #   #if not, new_journey = journey_class.new(entry_station)
  #   #complete?
  # end

  # def complete?
  #   @entry_station && @exit_station != nil
  # end


end
