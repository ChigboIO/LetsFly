class ConfirmationMailer < ApplicationMailer
  def thank_you(booking_id)
    @booking = Booking.find(booking_id)
    @user = @booking.user_or_passenger
    mail(to: @user.email, subject: "Thank You For Your Patronage")
  end
end
