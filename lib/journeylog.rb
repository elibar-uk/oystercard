require_relative 'journey'

class JourneyLog

  attr_reader :journey_history

  def initialize #(journey_class = Journey)
    # @journey_class = journey_class
    @journey_history = []
  end

  def start(entry_station)
    @current_journey = Journey.new(entry_station)
  end

  def finish(exit_station)
    @current_journey.end(exit_station)
    @journey_history << @current_journey.current_journey
  end

  def journeys
    #
  end

  private

  def current_journey
    #if the current journey is incomplete, return it (add it to the journey_history)
    #if not, new_journey = journey_class.new(entry_station)
  end

  # def complete?
  #   @entry_station && @exit_station != nil
  # end


end
