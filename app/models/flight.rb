class Flight < ActiveRecord::Base
  belongs_to :origin_airport, class_name: "Airport"
  belongs_to :destination_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings
end
