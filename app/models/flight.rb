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

  def self.get_match(params)
    match = all
    match = match.where(
      "origin_airport_id = ?",
      params[:origin_airport_id]
    ) unless params[:origin_airport_id] == ""

    match = match.where(
      "destination_airport_id = ?",
      params[:destination_airport_id]
    ) unless params[:destination_airport_id] == ""

    match = match.where(
      "available_seats >= ?",
      params[:available_seats].to_i
    ) unless params[:available_seats] == ""

    match = match.where(
      "Date(departure_datetime) = ?",
      Date.parse(params[:departure_datetime]).strftime("%Y-%m-%d")
    ) unless params[:departure_datetime] == ""

    # match = all if match.nil?
    match
  end
end
