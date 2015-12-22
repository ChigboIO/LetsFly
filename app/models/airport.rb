class Airport < ActiveRecord::Base
  has_many :flights, foreign_key: :origin_airport_id

  validates :name, presence: true
  validates :state, presence: true

  def name_with_state
    name + ", " + state
  end
end
