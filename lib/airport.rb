require_relative './weather'

class Airport

	include Weather

	def initialize
		planes
		capacity
		weather
	end

	def planes
		@planes ||= []
	end

	def capacity
		@capacity = 10
	end

	def receive(plane)
		raise "Stormy weather conditions! Plane cannot land here right now. Please try again when the weather improves." if weather == "Stormy"
		raise "Airport is full! Plane cannot land here." if planes.count == capacity
		plane.land
    	@planes << plane
	end

	def release(plane)
		raise "Stormy weather conditions! Plane cannot take-off right now. Please try again when the weather improves." if weather == "Stormy"
		raise "Error! This plane is not in this airport." if !planes.include?(plane)
		plane.take_off
		@planes.delete(plane)
	end

end