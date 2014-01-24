require_relative './colors'

def clear
  puts "\e[H\e[2J"
end

def header
  clear()
  puts cyan("-" * 75)
  puts cyan("|||||" + ("+" * 65) + "|||||")
  puts cyan(("|||||" + "=" * 26) + red("VENUE MANAGER") + cyan(("=" * 26) + "|||||"))
  puts cyan("|||||" + ("+" * 65) + "|||||")
  puts cyan("-" * 75)
  puts
end

def intro
puts "Welcome to".center(65).rstrip + red(" VENUE MANAGER!")
puts "Enter one of the following options to continue:".center(75)
puts
puts "Type 'view' to print a venue's details;".center(55)
puts "Type 'add' to create a new venue;".center(50)
puts "Type 'kill' to delete an existing venue;".center(57)
puts "Type 'update' to revise a venue's details;".center(59)
puts "Type 'new' to add a new show for a venue;".center(58)
puts "Type 'shows_at' to display shows booked at a venue;".center(67)
puts "Type 'distance' to determine the distance between two venues;".center(78)
puts "Type 'by_city' to print all shows in a given city;".center(67)
puts "Type 'radius' to display all venues within a specified radius.".center(79)
puts
end

def pull_venue_name
	puts "Enter new venue name:"
	name = gets.chomp
end

def pull_venue_address
	puts "Enter venue address:"
	address = gets.chomp
end

def pull_venue_city
	puts "Enter venue city:"
	city = gets.chomp
end

def pull_venue_state
	puts "Enter venue state:"
	state = gets.chomp
end

def venue_added venue
	clear()
	puts
	puts black("The following venue has been added successfully:" + "\n")
	puts red(venue.name)
	puts red(venue.address)
	puts red(venue.city)
	puts red(venue.state)
	puts red("Latitude: " + venue.latitude.to_s)
	puts red("Longitude: " + venue.longitude.to_s)
	puts
end




