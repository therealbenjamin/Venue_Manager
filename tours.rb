#!/usr/bin/env ruby
# -*- ruby -*-

command = ARGV[0]
arguments = ARGV.drop(1)

if arguments.empty?
	print "You must provide a venue name."
else
	missing_things = []
	unless arguments.index("--address")
		missing_things << "address"
	end
	unless arguments.index("--city")
		missing_things << "city"
	end
	unless arguments.index("--state")
		missing_things << "state"
	end
	unless arguments.index("--address")
		missing_things << "postal code"
	end
	print "You must provide a venue #{missing_things.join(", ")}."
end