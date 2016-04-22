require_relative 'journey'

class JourneyLog

  def initialize(station, journey_class = Journey)
    journey_class.new(station)
  end


end
