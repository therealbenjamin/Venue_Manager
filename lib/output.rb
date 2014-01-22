require_relative './colors'

def clear
  puts "\e[H\e[2J"
end

def header
  clear()
  puts cyan("-" * 75)
  puts cyan("|||||" + ("+" * 65) + "|||||")
  puts cyan(("|||||" + "=" * 26) + "VENUE MANAGER" + ("=" * 26) + "|||||")
  puts cyan("|||||" + ("+" * 65) + "|||||")
  puts cyan("-" * 75)
  puts
end

def intro
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




