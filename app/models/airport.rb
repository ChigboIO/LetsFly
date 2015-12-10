class Airport < ActiveRecord::Base
  has_many :flights

  def name_with_state
    name + ", " + state
  end
end
