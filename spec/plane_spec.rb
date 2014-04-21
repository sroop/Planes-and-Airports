require 'plane'
# require 'weather'

describe "Plane" do
	
	context "Initialization:" do
		
		it 'needs a name' do
			boeing = Plane.new
		end

		it 'will be flying' do
			boeing = Plane.new
			expect(boeing).to be_flying
		end
	end

	context "Basic Landing and Take-off:" do
		
		it 'can land' do
			boeing = Plane.new
			boeing.land
			expect(boeing).to_not be_flying
		end

		it 'can take-off' do
			boeing = Plane.new
			boeing.land
			boeing.take_off
			expect(boeing).to be_flying
		end

	end

	context "Raise errors for idiotic commands:" do
		
		it 'cannot land when it is already not flying' do
			boeing = Plane.new
			boeing.land
			expect(boeing).to_not be_flying
			expect{ (boeing.land) }.to raise_error(RuntimeError)
		end

		it 'cannot take-off when it is already flying' do
			boeing = Plane.new
			expect(boeing).to be_flying
			expect { (boeing.take_off) }.to raise_error(RuntimeError)			
		end

	end
		
		# it 'raises an error if a plane is flying and tries to land without going to an airport' do
		# 	heathrow = Airport.new
		# 	plane = double :plane
		# 	expect(plane).to receive(:land)
		# 	expect{ (plane.land) }.to raise_error(RuntimeError)
		# end

end