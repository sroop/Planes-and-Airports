class Airport
	def initialization
		planes
		capacity
	end

	def planes
		@planes ||= []
	end

	def capacity
		@default_capacity = 10
	end

	def receive(plane)
		plane.land
    	@planes << plane
	end
end