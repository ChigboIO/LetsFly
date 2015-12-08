class FlightsController < ApplicationController
  def index
  end

  def search
    # @result = Flight.where(flight_params)
    @result = Flight.all.sample
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  private

  def flight_params
    params.require(:flight).permit
  end
end
