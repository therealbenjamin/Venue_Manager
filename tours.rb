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
	name = pull_venue_name()
	venue = Venue.find_by_name(name, db)
	clear()
	puts venue.display_full_record

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

	venue1 = Venue.find_by_name(name1, db)
	puts cyan("OPTION TWO").center(20)
	name2 = pull_venue_name()
	venue2 = Venue.find_by_name(name2, db)

	distance = venue1.get_distance_to(venue2, db)

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
