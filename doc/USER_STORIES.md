USER STORIES

----------------------------------------------------------------------

As a venue manager or talent buyer: In order to keep my list of venues up to date, I want to add a new venue to the database.

Usage: ./tours add "Ryman Auditorium" [address] [city] [state] [zip]
Acceptance Criteria:
- Adds a venue to the database that can then be updated using the update command


As a venue manager or talent buyer: In order to keep my list of venues up to date, I want to be able to delete an existing venue from the database.

Usage: ./tours kill "Ryman Auditorium"
Acceptance Criteria:
- The specified date is no longer in the database

As a venue manager or talent buyer: In order to keep my list of venues up to date, I want to be able to update an existing venue in the database.

Usage: ./tours update "Ryman Auditorium" [address] [city] [state] [zip]
Acceptance Criteria:
- The specified record is updated in the system
- When user prints the record, the new information is available

As a venue manager: In order to establish a record of shows booked at a given venue, I want to add an artist, show date, and show time.

Usage: ./tours new "Ryman Auditorium" "String Cheese Incident" "2014-04-27"
Acceptance Criteria:
- When user prints a list of shows going on at a venue, the new show is now in the list

As a venue manager or talent buyer: In order to keep track of what is going on at one of my venues, I want to print a list of shows booked at a given venue.

Usage: ./tours shows_at "Ryman Auditorium"
Acceptance Criteria:
- Prints out a list of all shows at the specified venue

As a talent buyer: In order to determine whether a potential show violates a radius clause, I want to determine the distance between two venues.

Usage: ./tours distance "Ryman Auditorium" "Murfreesboro Civic Center"
Acceptance Criteria:
- Prints the distance in miles between the venues

As a talent buyer: In order to develop a good idea of what venues are around me, I want to print a list of all venues in my city.

Usage: ./tours by_city "Nashville, TN"
Acceptance Criteria:
- Prints a list of all venues in the database for the city it is given

As a talent buyer: In order to know what is within a specific distance of me, I want to enter my address and a distance and print a list of all venues within that radius.

Usage: ./tours radius "Nashville, TN" 120
Acceptance Criteria:
- Prints all venues within the specified radius



