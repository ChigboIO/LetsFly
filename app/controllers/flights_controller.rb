class FlightsController < ApplicationController
  def index
    @presenter = Flights::IndexPresenter.new(
      Flight.not_departed.paginate(page: params[:page], per_page: 30)
    )
  end

  def search
    @presenter = Flights::IndexPresenter.new(
      Flight.not_departed.get_match(flight_params)
    )
    @presenter.seats = flight_params[:available_seats]
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
