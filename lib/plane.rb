class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def land
		raise "Plane has already landed, idiot!" if !@flying
		@flying = false
	end

	def take_off
		raise "Plane is already flying, idiot!" if @flying
		@flying = true
	end
	
end