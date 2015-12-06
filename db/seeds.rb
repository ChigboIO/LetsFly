# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rake db:seed
# (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"
require "faker"

Airport.destroy_all
Flight.destroy_all

CSV.foreach("airports.csv", headers: true) do |row|
  Airport.create! row.to_hash
end

airlines = ["Arik Air", "Dana Air", "Aero Contractors", "Air Peace", "Allied Air", "Associated Aviation", "Azman Air", "Dornier Aviation Nigeria", "Kabo Air", "Max Air", "Med-View Airline", "Overland Airways", "TAT Nigeria"]

3.times do
  flight_time = Random.rand(0..30)
  date_time = Faker::Time.forward(12, :morning)
  flight = Flight.new
  flight.airline = airlines.sample
  flight.origin_airport_id = Airport.all.sample.id
  flight.destination_airport_id = Airport.where.not(id: flight.origin_airport_id).sample.id
  flight.departure_datetime = date_time
  flight.arrival_datetime = date_time + flight_time.hour
  flight.price = Faker::Commerce.price
  flight.capacity = Random.rand(100..200)
  flight.available_seats = 200 - flight.capacity - Random.rand(0..100)
  flight.save!
end
