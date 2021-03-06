require_relative './db'

class Show

	attr_accessor :id, :artist, :showdate, :venue_id

	def initialize options={}
		@id = options[:id]
		@artist = options[:artist]
		@showdate = options[:showdate]
		@venue_id = options[:venue_id]
	end

	def new_show db, record
		db.connection.execute("INSERT INTO shows(artist, showdate, venue_id) VALUES('#{artist}', '#{showdate}', '#{record[0][0]}')")
		puts "A show for " + blue("#{artist}") + " has been added for " + blue("#{record[0][1]}") + " for the following date: " + red("#{showdate}.")
	end

	def all_shows
		shows = db.connection.execute("SELECT * FROM shows INNER JOIN venues ON venues.id = shows.venue_id")
		binding.pry
		puts shows
	end

	def shows_by_venue

	end


end