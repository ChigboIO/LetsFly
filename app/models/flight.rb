class Flight < ActiveRecord::Base
  belongs_to :origin_airport, class_name: "Airport"
  belongs_to :destination_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  validates :flight_no, presence: true
  validates :airline, presence: true
  validates :origin_airport_id, presence: true
  validates :destination_airport_id, presence: true
  validates :departure_datetime, presence: true
  validates :arrival_datetime, presence: true
  validates :capacity, presence: true
  validates :available_seats, presence: true
  validates :price, presence: true

  scope(
    :not_departed,
    lambda do
      where("departure_datetime > ?", Time.now)
    end
  )

  scope(
    :coming_from,
    lambda do |id|
      where("origin_airport_id = ?", id) unless id == ""
    end
  )

  scope(
    :going_to,
    lambda do |id|
      where("destination_airport_id = ?", id) unless id == ""
    end
  )

  scope(
    :has_enough_seats,
    lambda do |seats|
      where("available_seats >= ?", seats) unless seats == 0
    end
  )

  scope(
    :takeoff_on,
    lambda do |date|
      where(
        "Date(departure_datetime) = ?", Date.parse(date).strftime("%Y-%m-%d")
      ) unless date == ""
    end
  )

  def self.get_match(params)
    coming_from(params[:origin_airport_id]).
      going_to(params[:destination_airport_id]).
      has_enough_seats(params[:available_seats].to_i).
      takeoff_on(params[:departure_datetime])
  end

  def decorate
    @decorate ||= FlightDecorator.new(self)
  end
end
