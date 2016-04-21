require 'journey'

describe Journey do
let(:journey) {described_class.new(entry_station)}
let(:entry_station) {double :entry_station }
let(:exit_station) {double :exit_station }
  it "has an entry station" do
    expect(journey.entry_station).to eq entry_station
  end
  it "journey is not completed at the start" do
    expect(journey).to_not be_complete

  end
  it "journey is completed at the end" do
    journey.finish(exit_station)
    expect(journey).to be_complete
end
end
