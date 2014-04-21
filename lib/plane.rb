require_relative './weather'

class Plane

	include Weather

	def initialize
		@flying = true
		weather
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