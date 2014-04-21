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

	context "Control Flow:" do
		
		it 'receives a plane when a plane lands' do
			heathrow = Airport.new
			plane = double :plane
			expect(heathrow.planes.count).to eq(0)
			expect(plane).to receive(:land)
			heathrow.receive(plane)
			expect(heathrow.planes.count).to eq(1)
		end

		it 'releases a plane when a plane takes-off' do
			heathrow = Airport.new
			plane = double :plane
			expect(heathrow.planes.count).to eq(0)
			expect(plane).to receive(:land)
			heathrow.receive(plane)
			expect(heathrow.planes.count).to eq(1)
			expect(plane).to receive(:take_off)
			heathrow.release(plane)
			expect(heathrow.planes.count).to eq(0)
		end

		it 'raises an error if a plane tries to land and the airport is at full capacity' do
			heathrow = Airport.new
			plane = double :plane
			expect(heathrow.planes.count).to eq(0)
			(heathrow.capacity).times { expect(plane).to receive (:land) }
			(heathrow.capacity).times { heathrow.receive(plane) }
			expect(heathrow.planes.count).to eq(heathrow.capacity)
      		expect{ (heathrow.receive(plane)) }.to raise_error(RuntimeError)
		end

		it 'raises an error if a plane tries to take off from an airport is it not in' do
			heathrow = Airport.new
			plane = double :plane
			expect{ (heathrow.release(plane)) }.to raise_error(RuntimeError)


		end

	end

end