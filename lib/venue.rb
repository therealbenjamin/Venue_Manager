class Venue

	attr_accessor :name, :address, :city, :state, :postal_code, :latitude, :longitude

	def initialize name, address, city, state, postal_code
		@name = name
		@address = address
		@city = city
		@state = state
		@postal_code = postal_code
	end

end