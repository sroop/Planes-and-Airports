require 'airport'

describe "Airport" do
	
	context "Initialization:" do

		it 'needs a name' do
			heathrow = Airport.new
		end

		it 'has no planes' do
			heathrow = Airport.new
			expect(heathrow.planes.count).to eq(0)
		end

		it 'has a capacity to hold 10 planes' do
			heathrow = Airport.new
			@default_capacity = 10
      		expect(heathrow.capacity).to eq(@default_capacity)
		end

	end

end