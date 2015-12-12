class BookingsController < ApplicationController
  def show
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: params[:flight_id])
    params[:seats].to_i.times { @booking.passengers.build }
  end

  def create
    book = Booking.new(booking_params)
    if book.save
      redirect_to checkout_bookings_path(booking_id: book.id)
    else
      redirect_to :back
    end
  end

  def checkout
    @booking = Booking.find(params[:booking_id])
  end

  def confirmation
    @booking = Booking.find(params[:booking_id])
  end

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: [:passenger_id, :name, :email, :phone]
    )
  end
end
