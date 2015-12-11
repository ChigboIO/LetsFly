class BookingsController < ApplicationController
  def index
  end

  def show
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: params[:flight_id])
    params[:id].to_i.times { @booking.passengers.build }
  end

  def create
    book = Booking.new(booking_params)
    if book.save
      redirect_to checkout_flight_bookings_path(booking_id: book.id)
    else
      redirect_to :back
    end
  end

  def checkout
  end

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: [:passenger_id, :name, :email, :phone]
    )
  end
end
