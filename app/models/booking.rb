class Booking < ActiveRecord::Base
  belongs_to :flight
  has_many :passengers
end
