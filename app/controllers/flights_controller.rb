class FlightsController < ApplicationController
  def search
    @flights = Flight.get_match(flight_params)
    @seats = flight_params[:available_seats]
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def flight_params
    params.require(:flight).permit(
      :origin_airport_id,
      :destination_airport_id,
      :departure_datetime,
      :available_seats
    )
  end
end
