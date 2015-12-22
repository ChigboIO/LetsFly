class User < ActiveRecord::Base
  has_many :bookings
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  }
end
