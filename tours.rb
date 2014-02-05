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

if argument == "add"
	name = pull_venue_name()
	address = pull_venue_address()
	city = pull_venue_city()
	state = pull_venue_state()

	venue = Venue.new(name: name, address: address, city: city, state: state)
	venue.geocode
	venue.create(db)

	venue_added(venue)
elsif argument == "view"
	name = pull_venue_name()
	venue = Venue.find_by_name(name, db)
	clear()
	puts venue.display_full_record
elsif argument == "update"
	venue = Venue.new(name: name, address: address, city: city, state: state)
	venue.update(db)
elsif argument == "kill"
	venue = Venue.new(name: name, address: address, city: city, state: state)
	venue.kill(db)
elsif argument == "distance"
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
elsif argument == "new"
	puts "Enter the following details if you would like to add a " + red("SHOW.")
	name = pull_venue_name
	record = db.get_venue_by_name(name)

	puts "Please enter the name of the artist:"
	artist = gets.chomp
	puts "Please enter the show date (YYYY-MM-DD):"
	showdate = gets.chomp

	show = Show.new(artist: artist, showdate: showdate)
	show.new_show(db, record)
elsif argument == "all_shows"
	shows = db.connection.execute("SELECT venues.name, shows.artist, shows.showdate FROM shows INNER JOIN venues ON venues.id = shows.venue_id")
	puts
	puts shows
elsif argument == "shows_at"
	puts red("Enter venue name:")
	name = gets.chomp
	shows = db.connection.execute("SELECT venues.name, shows.artist, shows.showdate FROM shows INNER JOIN venues ON venues.id = shows.venue_id WHERE name = ?", [name])
	puts black("The following shows have been booked at the venue ") + red("#{name}") + black(":")
	puts shows
else
	puts red("You have entered an INVALID COMMAND.")
end

