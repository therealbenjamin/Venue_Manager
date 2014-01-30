require 'spec_helper'
require 'show'
require 'db'
require 'pry'
require 'venue'
require 'show'

describe Show do
	describe '#initialize' do
		it 'populates attributes' do
			show = Show.new(artist: 'Test Artist', showdate: '1983-04-27')
			expect(show.artist).to eq('Test Artist')
			expect(show.showdate).to eq('1983-04-27')
		end
	end
	describe '#new_show' do
		it 'creates a new show' do
			show = Show.new(artist: 'Test Artist', showdate: '1983-04-27')
			db = DB.new

		end
	end
	describe '#shows_by_venue' do
		it 'prints each show for a given venue' do

		end
	end
end