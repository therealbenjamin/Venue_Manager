require 'sqlite3'

class DB

	attr_accessor :db

	def initialize
		@db = SQLite3::Database.new "data/venue_manager.db"
	end

	def pull_venues
    venues = []
    @db.execute( "SELECT * FROM venues" ) do |row|
    	venues << ["#{row[0]}", "#{row[1]}", "#{row[2]}", "#{row[3]}", "#{row[4]}", "#{row[5]}", "#{row[6]}"]
    end
    venues
  end

  def get_venue_by_name name
  	venue = []
  	@db.execute( "SELECT * FROM venues where name = '#{name}'" ) do |row|
  		venue << row
  	end
  	venue
  end

end