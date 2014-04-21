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

end