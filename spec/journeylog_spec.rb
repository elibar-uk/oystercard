require 'journeylog'

describe JourneyLog do
  let(:journey_class) { double(:journey_class, new: journey) }
  let(:entry_station) {double :entry_station }
  let(:exit_station) {double :exit_station }
  let(:station){ double :station }
  let(:journey) { double(:journey) }

  subject {described_class.new(journey_class)}

  it { expect(subject).to respond_to(:start).with(1).argument }

  describe '#journey_history' do
    it 'can hold a history' do
      expect(subject.journey_history).to eq []
    end
  end

  describe '#start' do
    it 'starts a new journey' do
      expect(journey_class).to receive(:new).with(station)
      subject.start(station)
    end
  end

  describe '#finish' do
    it 'add the current_journey to the journey_history' do
      allow(journey).to receive(:end).and_return exit_station
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.journeys).to include journey
    end
    it "sets current journey to nil after it is recorded" do
      allow(journey).to receive(:end).and_return exit_station
      subject.start(entry_station)
      subject.finish(exit_station)
      expect(subject.current_journey).to eq nil
    end
  end
end
