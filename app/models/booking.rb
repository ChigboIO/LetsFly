class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passengers
  belongs_to :user

  validates :flight_id, presence: true

  accepts_nested_attributes_for :passengers

  before_create :make_new

  def make_new
    self.paid = false
    self.booking_number = Random.rand(1_000_000_000..9_999_999_999).to_s
    self.amount = flight.price * passengers.size
  end

  def user_or_passenger
    if user.nil?
      passengers.first
    else
      user
    end
  end

  def remaining_seats
    flight.available_seats - passengers.size
  end

  def release_seats
    flight.available_seats += passengers.size
    flight.save
    destroy
  end
end
