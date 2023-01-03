# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

airports =
  ["Los Angeles", "LAX"],
  ["Dallas Fort-Worth", "DFW"],
  ["New York", "NYC"],
  %w[Denver DEN],
  %w[Boston BOS],
  %w[Miami MIA],
  ["Houston Intercontinental", "IAH"],
  %w[Pittsburg PIT],
  ["Las Vegas", "LAS"],
  %w[Atlanta ATL]

airports.each do |name, city_code|
  Airport.create!(name: name, iata_code: city_code)
end

airlines = %W[Delta American United]

airlines.each { |airline| Airline.create! name: airline }

Airport.all.each do |departure|
  Airport.all.each do |arrival|
    next if departure == arrival
    Airline.all.each do |airline|
      duration = rand(100..300)
      30.times do
        flight_number = rand(1000..1999)
        Flight.create!(
          origin_id: departure.id,
          destination_id: arrival.id,
          duration: duration,
          flight_number: flight_number,
          airline_id: airline.id,
          departure_time:
            Faker::Time.between_dates(
              from: Date.today - 1,
              to: Date.today + 30,
              period: :day
            )
        )
      end
    end
  end
end

Flight.all.each do |flight|
  flight.update(departure_date: flight.departure_time.strftime("%d-%m-%Y"))
end
