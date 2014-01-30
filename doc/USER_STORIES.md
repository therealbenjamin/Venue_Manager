# USER STORIES

##### As a venue manager or talent buyer: In order to view a venue, I want to enter the name of said venue and print the venue's details.

<pre>
Usage: ./tours view "Ryman Auditorium"
Acceptance Criteria:
- Asks for the name of a venue
- Prints prints the details of the venue from the database
</pre>

##### As a venue manager or talent buyer: In order to keep my list of venues up to date, I want to add a new venue to the database.

<pre>
Usage: ./tours add "Ryman Auditorium"
Acceptance Criteria:
- Asks for the name of a venue
- Prints out a series of questions about the venue
- Prints the data and requests confirmation
- Adds the venue and details to the database
</pre>

##### As a venue manager or talent buyer: In order to keep my list of venues up to date, I want to be able to delete an existing venue from the database.

<pre>
Usage: ./tours kill "Ryman Auditorium"
Acceptance Criteria:
- Prints the venue name and details
- Asks the user for confirmation that the venue should be removed
- Upon confirmation, deletes the record from the database
</pre>

##### As a venue manager or talent buyer: In order to keep my list of venues up to date, I want to be able to update an existing venue in the database.

<pre>
Usage: ./tours update "Ryman Auditorium"
Acceptance Criteria:
- Prints the current details about the venue
- Prints a question for each detail to be modified
- The specified record is updated in the system
- Prints the updated information about the venue
</pre>

##### As a venue manager: In order to establish a record of shows booked at a given venue, I want to add an artist, show date, and show time.

<pre>
Usage: ./tours new "Ryman Auditorium"
Acceptance Criteria:
- Prints questions about the show
- User enters data regarding the artist, date, and show time
- Prints a list of shows for the venue to which a date has been added
</pre>

##### As a venue manager or talent buyer: In order to keep track of what is going on at one of my venues, I want to print a list of shows booked at a given venue.

<pre>
Usage: ./tours shows_at "Ryman Auditorium"
Acceptance Criteria:
- Prints out a list of all shows at the specified venue
</pre>

##### As a talent buyer: In order to determine whether a potential show violates a radius clause, I want to determine the distance between two venues.

<pre>
Usage: ./tours distance "Ryman Auditorium" "Murfreesboro Civic Center"
Acceptance Criteria:
- Prints the distance in miles between the venues
</pre>

##### As a talent buyer: In order to develop a good idea of what venues are around me, I want to print a list of all venues in my city.

<pre>
Usage: ./tours by_city "Nashville, TN"
Acceptance Criteria:
- Prints a list of all venues in the database for the city it is given
</pre>

##### As a talent buyer: In order to know what is within a specific distance of me, I want to enter my address and a distance and print a list of all venues within that radius.

<pre>
Usage: ./tours radius
Acceptance Criteria:
- Prints questions about a user's geographic location (address, city, state, zip)
- Prints all venues within the specified radius
</pre>


