class Journey

  attr_reader :entry_station, :exit_station

  MINIMUM_FARE = 1
  MAXIMUM_FARE = 6

  def initialize(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def fare
    return MAXIMUM_FARE unless complete?
    MINIMUM_FARE
  end

  def complete?
    @entry_station && @exit_station != nil
  end

end
