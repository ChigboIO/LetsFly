class PagesController < ApplicationController
  def index
    @flight = Flight.new
  end
end
