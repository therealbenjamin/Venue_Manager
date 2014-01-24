# require 'minitest/autorun'
# require_relative './helper'
# require_relative '../lib/colors'

# class TestAddVenue < MiniTest::Unit::TestCase

# 	def test_view_venue_details
# 		assert false, "Missing test implementation"
# 	end

# 	def test_valid_venue_gets_saved
# 		assert false, "Missing test implementation"
# 	end

# 	def test_invalid_purchase_does_not_get_saved
# 		assert false, "Missing test implementation"
# 	end

# 	def test_error_msg_for_missing_name
# 		actual =  `./tours.rb add`
# 		expected = red("You must provide a venue name.")
# 		assert_equal expected, actual
# 	end

# 	def test_error_msg_for_missing_address
# 		actual =  `./tours.rb add Ryman Auditorium`
# 		expected = "You must provide a venue address."
# 		assert_equal expected, actual
# 	end

# 	def test_error_msg_for_missing_city
# 		actual =  `./tours.rb add --city Nashville`
# 		expected = "You must provide a venue city."
# 		assert_equal expected, actual
# 	end

# 	def test_error_msg_for_missing_state
# 		actual =  `./tours.rb add`
# 		expected = "You must provide a venue state."
# 		assert_equal expected, actual
# 	end

# 	def test_error_msg_for_missing_postal_code
# 		actual =  `./tours.rb add`
# 		expected = "You must provide a venue postal code."
# 		assert_equal expected, actual
# 	end

# end