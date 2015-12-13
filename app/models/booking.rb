class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passengers
  belongs_to :user

  accepts_nested_attributes_for :passengers
  # reject_if lambda { |attr| attr.}

  def user_or_passenger
    if user.nil?
      passengers.first
    else
      user
    end
  end

  def self.make_new(params)
    book = new(params)
    book.user_id = current_user.id if current_user
    book.booking_number = Random.rand(1_000_000_000..9_999_999_999).to_s
    book.amount = book.flight.price * book.passengers.size
    book.paid = false
    book
  end

  def remaining_seats
    flight.available_seats - passengers.size
  end
end
