#!/usr/bin/env ruby
# -*- ruby -*-

require 'geocoder'
require 'sqlite3'
require 'pry'

require_relative 'lib/colors'
require_relative 'lib/db'
require_relative 'lib/output'

db = DB.new
venues = db.pull_venues

header()

puts "Welcome to" + red(" VENUE MANAGER!")
puts "Enter one of the following options to continue:"
puts
puts "'view' prints a venue's details;"
puts "'add' creates a new venue;"
puts "'kill' deletes a venue;"
puts "'update' updates a venue's details;"
puts "'new' adds a new show for a venue;"
puts "'shows_at' displays shows booked at a venue;"
puts "'distance' displays the distance between two venues;"
puts "'by_city' displays all shows in a given city;"
puts "'radius' displays all venues within a specified radius."
puts

argument = gets.chomp

case argument
when "view"
	puts "Enter venue name:"
	name = gets.chomp
	record = db.get_venue_by_name(name)
	puts record[0]
when "add"
	puts "Enter new venue name:"
	name = gets.chomp
	puts "Enter venue address:"
	address = gets.chomp
	puts "Enter venue city:"
	city = gets.chomp
	puts "Enter venue state:"
	state = gets.chomp
	db.db.execute("INSERT INTO venues (name, address, city, state)
		VALUES (?, ?, ?, ?)",
		[name, address, city, state])
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