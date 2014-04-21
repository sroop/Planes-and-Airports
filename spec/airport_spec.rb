require 'airport'
require 'weather'

describe "Airport" do

	let(:heathrow) { Airport.new }
	
	context "Initialization:" do

		it 'has a name' do
			heathrow = Airport.new
		end

		it 'has no planes' do
			expect(heathrow.planes.count).to eq(0)
		end

		it 'has a capacity to hold 10 planes' do
			@capacity = 10
      		expect(heathrow.capacity).to eq(@capacity)
		end

	end

	context "Control Flow for sunny weather conditions:" do
		
		it 'receives a plane when a plane lands' do
			heathrow.stub(:weather).and_return("Sunny")
			plane = double :plane
			expect(heathrow.planes.count).to eq(0)
			expect(plane).to receive(:land)
			heathrow.receive(plane)
			expect(heathrow.planes.count).to eq(1)
		end

		it 'releases a plane when a plane takes-off' do
			heathrow.stub(:weather).and_return("Sunny")
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
			heathrow.stub(:weather).and_return("Sunny")
			plane = double :plane
			expect(heathrow.planes.count).to eq(0)
			(heathrow.capacity).times { expect(plane).to receive (:land) }
			(heathrow.capacity).times { heathrow.receive(plane) }
			expect(heathrow.planes.count).to eq(heathrow.capacity)
      		expect{ (heathrow.receive(plane)) }.to raise_error(RuntimeError)
		end

		it 'raises an error if a plane tries to take off from an airport it is not in' do
			heathrow.stub(:weather).and_return("Sunny")
			plane = double :plane
			expect{ (heathrow.release(plane)) }.to raise_error(RuntimeError)
		end

	end

	context "Control Flow for stormy weather conditions:" do

      	it 'has stormy or sunny weather conditions (set to stormy for testing purposes)' do
      		heathrow.stub(:weather).and_return("Stormy")
      		expect(heathrow.weather).to eq("Stormy")
      	end

		it 'a plane cannot take-off if the weather is stormy' do
			plane = double :plane
			heathrow.stub(:weather).and_return("Sunny")
			expect(plane).to receive(:land)
			heathrow.receive(plane)
			heathrow.stub(:weather).and_return("Stormy")
			expect{ (heathrow.release(plane)) }.to raise_error(RuntimeError)
		end

		it 'plane cannot land if weather is stormy' do
			heathrow.stub(:weather).and_return("Stormy")
			plane = double :plane
			expect(heathrow.weather).to eq("Stormy")
			expect{ (heathrow.receive(plane)) }.to raise_error(RuntimeError)
		end

	end

end