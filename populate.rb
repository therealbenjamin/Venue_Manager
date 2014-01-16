require 'httparty'
require 'nokogiri'

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Nashville+Tennessee')

parse = Nokogiri::XML(response.body)

puts parse

parse.css('venue').each do |venue|
	# Venue.create({
	# 	name: venue.css('name'),
	# 	latitude: venue.css('latitude'),
	# 	longitude: venue.css('longitude')
	# })
	puts 'NAME:' + venue.css('name').text
	puts 'ADDRESS:' + venue.css('address').text
	puts 'CITY:' + venue.css('city_name').text
	puts 'STATE:' + venue.css('region_name').text
	puts 'LAT:' + venue.css('latitude').text
	puts 'LNG:' + venue.css('longitude').text
	puts '----------------------------------------'
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Memphis+Tennessee')

parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	# Venue.create({
	# 	name: venue.css('name'),
	# 	latitude: venue.css('latitude'),
	# 	longitude: venue.css('longitude')
	# })
	puts 'NAME:' + venue.css('name').text
	puts 'ADDRESS:' + venue.css('address').text
	puts 'CITY:' + venue.css('city_name').text
	puts 'STATE:' + venue.css('region_name').text
	puts 'LAT:' + venue.css('latitude').text
	puts 'LNG:' + venue.css('longitude').text
	puts '----------------------------------------'
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Knoxville+Tennessee')

parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	# Venue.create({
	# 	name: venue.css('name'),
	# 	latitude: venue.css('latitude'),
	# 	longitude: venue.css('longitude')
	# })
	puts 'NAME:' + venue.css('name').text
	puts 'ADDRESS:' + venue.css('address').text
	puts 'CITY:' + venue.css('city_name').text
	puts 'STATE:' + venue.css('region_name').text
	puts 'LAT:' + venue.css('latitude').text
	puts 'LNG:' + venue.css('longitude').text
	puts '----------------------------------------'
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=Chattanooga+Tennessee')

parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	# Venue.create({
	# 	name: venue.css('name'),
	# 	latitude: venue.css('latitude'),
	# 	longitude: venue.css('longitude')
	# })
	puts 'NAME:' + venue.css('name').text
	puts 'ADDRESS:' + venue.css('address').text
	puts 'CITY:' + venue.css('city_name').text
	puts 'STATE:' + venue.css('region_name').text
	puts 'LAT:' + venue.css('latitude').text
	puts 'LNG:' + venue.css('longitude').text
	puts '----------------------------------------'
end

response = HTTParty.get('http://api.eventful.com/rest/venues/search?app_key=ZZrT2f2Qc73RCND7&location=New+Orleans+Louisiana')

parse = Nokogiri::XML(response.body)

parse.css('venue').each do |venue|
	# Venue.create({
	# 	name: venue.css('name'),
	# 	latitude: venue.css('latitude'),
	# 	longitude: venue.css('longitude')
	# })
	puts 'NAME:' + venue.css('name').text
	puts 'ADDRESS:' + venue.css('address').text
	puts 'CITY:' + venue.css('city_name').text
	puts 'STATE:' + venue.css('region_name').text
	puts 'LAT:' + venue.css('latitude').text
	puts 'LNG:' + venue.css('longitude').text
	puts '----------------------------------------'
end