require 'geocoder'

require_relative './db'

class Venue

	attr_accessor :id, :name, :address, :city, :state, :latitude, :longitude

	def initialize options={}
		@id = options[:id]
		@name = options[:name]
		@address = options[:address]
		@city = options[:city]
		@state = options[:state]
		@latitude = options[:latitude]
		@longitude = options[:longitude]
	end

	def geocode
	coordinates = Geocoder.coordinates(full_address)
	@latitude = coordinates[0]
	@longitude = coordinates[1]
	end

	def full_address
		@address + ", " + @city + ", " + @state
	end

	def create db
		db.connection.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [@name, @address, @city, @state, @latitude, @longitude])
	end

end