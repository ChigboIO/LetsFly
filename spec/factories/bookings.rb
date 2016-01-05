FactoryGirl.define do
  # flight = build(:flight)
  factory :booking do
    flight_id 1
    booking_number 1_234_567_890
    amount 54.50
    paid true
  end
end
