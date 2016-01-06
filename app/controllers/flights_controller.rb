class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @flights = Flight.paginate(page: params[:page], per_page: 30)
    @seats = 1
    @airports = Airport.all
  end

  def search
    @flights = Flight.get_match(flight_params)
    @seats = flight_params[:available_seats]
    respond_to do |format|
      format.html
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
