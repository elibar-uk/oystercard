class Journey

  MINIMUM_FARE = 1
  MAXIMUM_FARE = 6

  def initialize(*station)
    @entry_station = station[0]
  end

  def end(*station)
    @exit_station = station[0]
  end

  def fare
    return MAXIMUM_FARE unless complete?
    MINIMUM_FARE
  end

  def complete?
    @entry_station && @exit_station != nil
  end

  def current_journey
    {entry_station: @entry_station, exit_station: @exit_station}
  end

end
