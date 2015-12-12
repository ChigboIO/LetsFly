class BookingsController < ApplicationController
  def book
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

  def payment
    # perform payment operations here and redirect to confirmation page
    # Send mail to the passenger.
    booking_id = params[:booking_id]
    redirect_to confirmation_bookings_path(booking_id)
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
