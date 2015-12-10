class PagesController < ApplicationController
  def index
    @flight = Flight.new
    @flights = Flight.order("RANDOM()").limit(10)
    @seats = 1
    @airports = Airport.all
  end
end
