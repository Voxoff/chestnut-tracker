class Tracker < ApplicationRecord
  has_many :subtrackers

  def count
    subtrackers.pluck(:count).reduce(:+)
  end
end
