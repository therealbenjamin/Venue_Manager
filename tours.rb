#!/usr/bin/env ruby
# -*- ruby -*-

require 'geocoder'
require 'sqlite3'
require 'pry'

require_relative 'lib/colors'
require_relative 'lib/db'
require_relative 'lib/output'
require_relative 'lib/venue'
require_relative 'lib/show'

db = DB.new
# venues = db.pull_venues

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

when "new"

	puts "Enter the following details if you would like to add a " + red("SHOW.")
	name = pull_venue_name
	record = db.get_venue_by_name(name)

	puts "Please enter the name of the artist:"
	artist = gets.chomp
	puts "Please enter the show date (YYYY-MM-DD):"
	showdate = gets.chomp

	show = Show.new(artist: artist, showdate: showdate)
	show.new_show(db, record)

when "all_shows"
	shows = db.connection.execute("SELECT * FROM shows INNER JOIN venues ON venues.id = shows.venue_id")
	puts shows

end
