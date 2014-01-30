require 'spec_helper'
require 'venue'
require 'db'
require 'pry'

describe Venue do
	describe '#initialize' do
		it 'populates attributes' do
			venue = Venue.new(name: 'Test Venue', address: '123 Main Street', city: 'Anytown', state: 'TN')
			expect(venue.name).to eq('Test Venue')
			expect(venue.address).to eq('123 Main Street')
			expect(venue.city).to eq('Anytown')
			expect(venue.state).to eq('TN')
		end
	end
	describe '#geocode' do
		it 'sets latitude and longitude' do
			Geocoder.stub(coordinates: [12.345, 12.345])
			venue = Venue.new(name: 'Test Venue', address: '123 Main Street', city: 'Anytown', state: 'TN')
			venue.geocode
			expect(venue.latitude).to eq(12.345)
			expect(venue.longitude).to eq(12.345)
		end
	end
	describe '#full_address' do
		it 'gets the full address' do
			venue = Venue.new(name: 'Test Venue', address: '123 Main Street', city: 'Anytown', state: 'TN')
			expect(venue.full_address).to eq('123 Main Street, Anytown, TN')
		end
	end
	describe '#create' do
		it 'creates a new venue' do
			db = DB.new
			venue = Venue.new(name: 'Test Venue', address: '1400 Market Street', city: 'Chattanooga', state: 'TN')
			venue.create(db)
			expect(venue.latitude).to eq(35.0371599)
			expect(venue.longitude).to eq(-85.30728909999999)
		end
	end
	describe '#display_full_record' do
		it 'prints details for a venue' do
			venue = Venue.new(name: 'Test Venue', address: '1400 Market Street', city: 'Chattanooga', state: 'TN')
			output = venue.display_full_record
			expect(output).to include(venue.name)
			expect(output).to include(venue.address)
			expect(output).to include(venue.city)
			expect(output).to include(venue.state)
		end
	end
end


