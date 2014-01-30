require 'geocoder'

require_relative './db'
require_relative './output'

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
		geocode

		db.connection.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [@name, @address, @city, @state, @latitude, @longitude])
	end

	def display_full_record
		output = ""
		output << "\n"
		output << "Details for this venue are as follows:\n\n"
		output << red(@name) + "\n"
		output << red(@address) + "\n"
		output << red(@city) + "\n"
		output << red(@state) + "\n"
		output << red(@latitude) + "\n"
		output << red(@longitude) + "\n\n"
		output

	def update db
		puts red("UPDATE a venue record:")
		name = pull_venue_name()
		record = db.get_venue_by_name(name)
		puts "Details for this venue are as follows:"
		puts
		puts red(record[0][1])
		puts red(record[0][2])
		puts red(record[0][3])
		puts red(record[0][4])
		puts
		puts "Reset venue details:"
		puts
		new_name = pull_venue_name()
		new_address = pull_venue_address()
		new_city = pull_venue_city()
		new_state = pull_venue_state()

		db.connection.execute("UPDATE venues SET name = ?, address = ?, city = ?, state = ? WHERE(id = ?)", [new_name, new_address, new_city, new_state, record[0][0]])

		coordinates = Geocoder.coordinates(new_address + ", " + new_city + ", " + new_state)
		new_latitude = coordinates[0]
		new_longitude = coordinates[1]

		db.connection.execute("UPDATE venues SET latitude = '#{new_latitude}', longitude = '#{new_longitude}'")

		puts "Details have been successfully updated to:"
		new_record = db.get_venue_by_name(new_name)
		puts red(new_record[0][1])
		puts red(new_record[0][2])
		puts red(new_record[0][3])
		puts red(new_record[0][4])
		puts red(new_record[0][5])
		puts red(new_record[0][6])
	end

	def kill db
		puts "Enter the name of the venue you would like to " + red("DELETE:")
		name = gets.chomp
		db.connection.execute("DELETE FROM venues WHERE name = '#{name}'")
		puts "#{name} has been successfully removed from the database."
	end

	def self.find_by_name name, db
		results = []
  	db.connection.execute("SELECT * FROM venues where name = ?", [name]) do |row|
  		results << row
  	end
		new(id: results[0][0], name: results[0][1], address: results[0][2], city: results[0][3], state: results[0][4], latitude: results[0][5], longitude: results[0][6])
	end

	def get_distance_to venue, db
		Geocoder::Calculations.distance_between([self.latitude, self.longitude], [venue.latitude, venue.longitude]).round(2)
	end

end





