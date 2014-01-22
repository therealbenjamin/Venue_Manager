#!/usr/bin/env ruby
# -*- ruby -*-

require 'geocoder'
require 'sqlite3'
require 'pry'

require_relative 'lib/colors'
require_relative 'lib/db'
require_relative 'lib/output'
require_relative 'lib/venue'

db = DB.new
venues = db.pull_venues

header()
intro()

argument = gets.chomp

case argument
when "view"
	name = pull_venue_name
	record = db.get_venue_by_name(name)
	puts red(record[0][0])
	puts red(record[0][1])
	puts red(record[0][2])
	puts red(record[0][3])
when "add"
	name = pull_venue_name()
	address = pull_venue_address()
	city = pull_venue_city()
	state = pull_venue_state()

	coordinates = Geocoder.coordinates(address + ", " + city + ", " + state)
	latitude = coordinates[0]
	longitude = coordinates[1]

	record = db.db.execute("SELECT * FROM venues WHERE ID = (SELECT MAX(ID) FROM venues)")
	id = record[0][0] + 1
	binding.pry

	db.db.execute("INSERT INTO venues (id, name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?, ?)", [id, name, address, city, state, latitude, longitude])

	puts
	puts black("The following venue has been added successfully:" + "\n")
	puts red(name)
	puts red(address)
	puts red(city)
	puts red(state)
	puts red("Latitude: " + coordinates[0].to_s)
	puts red("Longitude: " + coordinates[1].to_s)
	puts
end

# puts "Enter a random number to get the details of the first random venue!"
# option1 = gets.to_i
# puts "Enter a random number to get the details of the second random venue!"
# option2 = gets.to_i

# puts "Details for venue # 1"
# puts venues[option1]
# puts "Details for venue # 2"
# puts venues[option2]

# distance = Geocoder::Calculations.distance_between([venues[option1][4], venues[option1][5]], [venues[option2][4], venues[option2][5]])

# print "These venues are "
# print distance
# print " miles apart. \n"



# command = ARGV[0]
# arguments = ARGV.drop(1)

# if arguments.empty?
# 	print red("You must provide a venue name.")
# else
# 	print red("You must provide a venue address.")
# end



# command = ARGV[0]
# arguments = ARGV.drop(1)

# if arguments.empty?
# 	print "You must provide a venue name."
# else
# 	missing_things = []
# 	unless arguments.index("--address")
# 		missing_things << "address"
# 	end
# 	unless arguments.index("--city")
# 		missing_things << "city"
# 	end
# 	unless arguments.index("--state")
# 		missing_things << "state"
# 	end
# 	unless arguments.index("--address")
# 		missing_things << "postal code"
# 	end
# 	print "You must provide a venue #{missing_things.join(", ")}."
# end