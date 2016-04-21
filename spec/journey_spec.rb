require 'journey'

describe Journey do
  let(:journey) {described_class.new(entry_station)}
  let(:entry_station) {double :entry_station }
  let(:exit_station) {double :exit_station }
  let(:min_fare) { described_class::MINIMUM_FARE }
  let(:max_fare) { described_class::MAXIMUM_FARE }

  it "has an entry station" do
    expect(journey.entry_station).to eq entry_station
  end

  it "has an exit station" do
    journey.finish(exit_station)
    expect(journey.exit_station).to eq exit_station
  end

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



end
