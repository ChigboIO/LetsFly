class Airport < ActiveRecord::Base
  has_many :flights, foreign_key: :origin_airport_id

  validates :name, presence: true
  validates :state, presence: true

  def decorate
    @decorate ||= AirportDecorator.new(self)
  end
end
