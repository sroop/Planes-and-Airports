require 'plane'

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

	context "landing and taking off:" do
		
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

end