class Airport < ActiveRecord::Base
  has_many :flights
end
