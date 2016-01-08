class BookingsController < ApplicationController
  before_action :authorize, only: [:index]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def book
    flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: flight.id)
    params[:seats].to_i.times { @booking.passengers.build }
  end

  def create
    book = Booking.new(booking_params)
    book.user_id = current_user.id if current_user

    if book.save
      book.flight.update(available_seats: book.remaining_seats)
      redirect_to checkout_bookings_path(booking_id: book.id)
    else
      redirect_to :back, alert: "Sorry, your flight was not booked"
    end
  end

  def manage
  end

  def search
    @booking = Booking.find_by_booking_number(params[:booking_number])
    if @booking.blank?
      redirect_to :back, notice: "No booking with that Number was found."
    else
      redirect_to edit_booking_path(@booking.id)
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
    render :book
  end

  def update
    booking = Booking.find(params[:id])
    booking.update(booking_params)
    ConfirmationMailer.thank_you(
      booking.id,
      "Updated Passengers' Information"
    ).deliver_now

    redirect_to :back, notice: "Booking updated successfully!"
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.release_seats
    redirect_to :back, notice: "Booking canceled successfully!"
  end

  def checkout
    @booking = Booking.find(params[:booking_id])
  end

  def payment
    booking_id = params[:booking_id]

    Booking.find(booking_id).update(paid: true)
    ConfirmationMailer.thank_you(
      booking_id,
      "Thank You For Your Patronage"
    ).deliver_now

    redirect_to(
      confirmation_bookings_path(booking_id),
      notice: "Payment confirmed!"
    )
  end

  def confirmation
    @booking = Booking.find(params[:booking_id])
  end

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: [:id, :passenger_id, :name, :email, :phone]
    )
  end
end
