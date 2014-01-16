Ruby Tours | Concert & Venue Database

==========

This is a basic CLI application that allows users to acquire temporal and geographic data regarding shows booked at various concert venues.

- ELEVATOR PITCH

Ruby Tours enables users to create, view, modify or delete information about upcoming events at different venues. The application will also accept two venues and evaluate the distance between them.

- PROJECT REQUIREMENTS

1. Simple feature set
2. CRUD
3. A nice complex query in there somewhere

- FEATURE LIST

1. Enter a venue and all pertinent data regarding said venue, e.g. city, state, postal code, buyer contact and phone number
2. View a complete list of venues
3. View venues by city and state
4. Update information about an existing venue
5. Delete a venue
6. Determine the distance between two venues
7. Generate a list of dates for shows booked at a specific venue
8. Add/remove dates for a given venue

- DATA SOURCE

This application will use the Eventful API to get data regarding different venues.

- SAMPLE DATA

The data drawn from Eventful will include the name, address, city, state, postal code, latitude and longitude for each venue. I have a script that uses httparty to access XML data and parses it with Nokogiri. For an example of the data in XML format, please see sample_data.xml.







