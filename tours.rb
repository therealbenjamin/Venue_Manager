#!/usr/bin/env ruby
# -*- ruby -*-

require_relative 'lib/colors'
require_relative 'lib/db'
require_relative 'lib/output'

header()

command = ARGV[0]
arguments = ARGV.drop(1)

if arguments.empty?
	print red("You must provide a venue name.")
else
	print red("You must provide a venue address.")
end



# command = ARGV[0]
# arguments = ARGV.drop(1)

# if arguments.empty?
# 	print "You must provide a venue name."
# else
# 	missing_things = []
# 	unless arguments.index("--address")
# 		missing_things << "address"
# 	end
# 	unless arguments.index("--city")
# 		missing_things << "city"
# 	end
# 	unless arguments.index("--state")
# 		missing_things << "state"
# 	end
# 	unless arguments.index("--address")
# 		missing_things << "postal code"
# 	end
# 	print "You must provide a venue #{missing_things.join(", ")}."
# end