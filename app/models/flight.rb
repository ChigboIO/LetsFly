class Flight < ActiveRecord::Base
  belongs_to :origin_airport, class_name: "Airport"
  belongs_to :destination_airport, class_name: "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.get_match(params)
    match = Flight.all
    match = where(
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
    match
  end
end
