#!/usr/bin/env ruby
# -*- ruby -*-

require 'geocoder'
require 'sqlite3'
require 'pry'

require_relative 'lib/colors'
require_relative 'lib/db'
require_relative 'lib/output'
require_relative 'lib/venue'
require_relative 'lib/shows'

db = DB.new
venues = db.pull_venues

header()
intro()

argument = gets.chomp

case argument

when "add"
	name = pull_venue_name()
	address = pull_venue_address()
	city = pull_venue_city()
	state = pull_venue_state()

	venue = Venue.new(name: name, address: address, city: city, state: state)
	venue.geocode
	venue.create(db)

	venue_added(venue)

when "view"
	venue = Venue.new(name: name, address: address, city: city, state: state)
	venue.view(db)

when "update"
	venue = Venue.new(name: name, address: address, city: city, state: state)
	venue.update(db)

when "kill"
	venue = Venue.new(name: name, address: address, city: city, state: state)
	venue.kill(db)

when "new"
	puts "Enter the name of the venue for which you would like to add a " + red("SHOW:")
	name = pull_venue_name
	record = db.get_venue_by_name(name)

	puts "Please enter the name of the artist:"
	artist = gets.chomp
	puts "Please enter the show date (YYYY-MM-DD):"
	date = gets.chomp
	db.connection.execute("INSERT INTO shows(artist, showdate, venue_id) VALUES('#{artist}', '#{date}', '#{record[0][0]}')")
	puts "A show for #{artist} has been added for #{record[0][1]} for the following date: #{date}."

when "distance"
	puts "Enter the names of two venues to get the " + red("DISTANCE") + " between them:"
	puts cyan("OPTION ONE").center(20)
	name1 = pull_venue_name()
	option1 = db.get_venue_by_name(name1)
	puts cyan("OPTION TWO").center(20)
	name2 = pull_venue_name()
	option2 = db.get_venue_by_name(name2)

	distance = Geocoder::Calculations.distance_between([option1[0][5], option1[0][6]], [option2[0][5], option2[0][6]]).round(2)

	print black("These venues are ")
	print red(distance)
	print black(" miles apart. \n")

end
