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

	context "taking-off, flying and landing" do
		
		it 'can land' do
			boeing = Plane.new
			boeing.landing
			expect(boeing).to_not be_flying
		end

	end

end