require 'httparty'
require 'nokogiri'
require 'sqlite3'

db = SQLite3::Database.new "data/venue_manager.db"

rows = db.execute <<-SQL
create table venues (
	name varchar(30),
	address varchar(50),
	city varchar(30),
	state varchar(25),
	latitude float,
	longitude float
	);
SQL

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Nashville+Tennessee')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)",
		[venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Memphis+Tennessee')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)",
		[venue.css('name').text,
			venue.css('address').text,
			venue.css('city_name').text,
			venue.css('region_name').text,
			venue.css('latitude').text,
			venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Knoxville+Tennessee')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Chattanooga+Tennessee')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=New+Orleans+Louisiana')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=New+Orleans+Louisiana')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Baltimore+Maryland')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Portland+Oregon')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Wilmington+Delaware')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Litchfield+Connecticut')
parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	db.execute("INSERT INTO venues (name, address, city, state, latitude, longitude)
		VALUES (?, ?, ?, ?, ?, ?)", [venue.css('name').text,
		venue.css('address').text,
		venue.css('city_name').text,
		venue.css('region_name').text,
		venue.css('latitude').text,
		venue.css('longitude').text])
end