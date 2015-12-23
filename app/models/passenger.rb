class Passenger < ActiveRecord::Base
  belongs_to :booking

  validates :name, presence: true
  validates :email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  }
end
