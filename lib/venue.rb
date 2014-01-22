require_relative './db'

def pull_venue_name
	puts "Enter venue name:"
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
