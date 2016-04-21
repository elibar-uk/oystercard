class Journey
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize (entry_station)
    @entry_station = entry_station
    @exit_station
    @journeys = {}
    @complete = false
  end
  def start(station)
    @entry_station = station
    @journeys[:entry_station]=station
    @complete = false
  end
  def finish(station)
    #@entry_station = nil
    @exit_station = station
    self
    @journeys[:exit_station]=station
    @complete=true
  end

  def complete?
    @complete
  end
  def fare
    if (@journeys.include? :entry_station) && (@journeys.include? :exit_station)
    1
  else
    return PENALTY_FARE
  end
  end
  private
  def caculate_penalty?

  end
end
