class Organisation < ApplicationRecord
  has_many :trackers

  def count
    trackers.pluck(:count).reduce(:+)
  end
end
