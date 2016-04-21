require 'journey'

describe Journey do
  let(:journey) {described_class.new(entry_station)}
  let(:entry_station) {double :entry_station }
  let(:exit_station) {double :exit_station }
  let(:min_fare) { described_class::MINIMUM_FARE }
  let(:max_fare) { described_class::MAXIMUM_FARE }
  let(:current_journey) {{entry_station: entry_station, exit_station: exit_station}}


  context 'when finishing journey' do
    context 'on an incomplete journey' do
      it 'charges a maximum fare' do
        expect(journey.fare).to be max_fare
      end
    end

    context 'on a complete journey' do
      before { journey.finish(exit_station) }
        it "it is set to complete" do
          expect(journey).to be_complete
        end

        it "it charges a minimum fare" do
          expect(journey.fare).to be min_fare
        end
    end
  end

  context "after one journey" do
    before {journey.finish(exit_station)}

    describe '#journeys' do
      it 'shows entry and exit stations' do
        expect(journey.current_journey).to include current_journey
      end
    end
  end
end
