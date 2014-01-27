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

		db.connection.execute("UPDATE venues SET name = '#{new_name}'")
		db.connection.execute("UPDATE venues SET address = '#{new_address}'")
		db.connection.execute("UPDATE venues SET city = '#{new_city}'")
		db.connection.execute("UPDATE venues SET state = '#{new_state}'")

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

	def get_distance db

	end

end





