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

	def view db
	name = pull_venue_name
	record = db.get_venue_by_name(name)
	clear()
	puts
	puts "Details for this venue are as follows:"
	puts
	puts red(record[0][1])
	puts red(record[0][2])
	puts red(record[0][3])
	puts red(record[0][4])
	puts red(record[0][5])
	puts red(record[0][6])
	puts
	end

	def geocode
	coordinates = Geocoder.coordinates(full_address)
	@latitude = coordinates[0]
	@longitude = coordinates[1]
	end

	def get_distance db

	end

	def full_address
		@address + ", " + @city + ", " + @state
	end

	def create db
		db.connection.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [@name, @address, @city, @state, @latitude, @longitude])
	end

	def update db

	end

	def kill db
		db.connection.execute("DELETE FROM venues WHERE name = '#{name}'")
	end

end





