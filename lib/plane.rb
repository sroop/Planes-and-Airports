class Plane

	def initialize
		@status = "flying"
	end

	def status
		@status
	end

	def land
		raise "Plane has already landed, idiot!" if @status == "landed"
		@status = "landed"
	end

	def take_off
		raise "Plane is already flying, idiot!" if @status == "flying"
		@status = "flying"
	end

end