class Journey
attr_reader :entry_station, :exit_station
  def initialize(station)
    @entry_station = station
    @complete = false
  end
  def finish(station)
    @complete = true
  end

  def complete?
    @complete
  end
end
