require 'journeylog'

describe JourneyLog do
  let(:journey_class) { double(:journey_class, new: journey) }
  let(:entry_station) {double :entry_station }
  let(:exit_station) {double :exit_station }
  let(:current_journey) {{entry_station: entry_station, exit_station: exit_station}}
  let(:journey) { double(:journey) }

  it { expect(subject).to respond_to(:start).with(1).argument }

  describe '#journey_history' do
    it 'can hold a history' do
      expect(subject.journey_history).to eq []
    end
  end

  # describe '#start' do
  #   it 'starts a new journey' do
  #     expect(journey_class).to receive(:new).with(entry_station: entry_station)
  #   end
  # end

  describe '#finish' do
    it 'add the current_journey to the journey_history' do
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journey_history).to include current_journey
    end
  end

end
