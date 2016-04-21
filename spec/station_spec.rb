require 'station'

describe Station do

	let(:zone) { double :zone }
	let(:station) { described_class.new(zone, name) }
	let(:name) { double :name }
		it "station has a zone" do
			expect(station.zone).to be zone
		end

		it "station has a name" do
			expect(station.name).to be name
		end

end
