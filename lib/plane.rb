class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def landing
		@flying = false
	end
end