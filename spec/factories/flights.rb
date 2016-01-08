FactoryGirl.define do
  factory :flight do
    flight_no 43
    airline "Emirate Airline"
    origin_airport_id 435
    destination_airport_id 76
    departure_datetime Time.zone.now
    arrival_datetime Time.zone.now
    price 54.23
    capacity 105
    available_seats 80
  end
end
