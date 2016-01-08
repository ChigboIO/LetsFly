module Flights
  class IndexPresenter
    attr_accessor :flights, :seats

    def initialize(flights)
      @flights = flights
      @seats = 1
    end

    def flight
      Flight.new
    end

    def airports
      Airport.all
    end
  end
end
