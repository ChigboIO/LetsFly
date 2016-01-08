class PagesController < ApplicationController
  def index
    @presenter = Flights::IndexPresenter.new(
      Flight.not_departed.order("departure_datetime").limit(10)
    )
  end
end
