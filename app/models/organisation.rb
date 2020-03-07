class Organisation < ApplicationRecord
  belongs_to :user
  has_many :trackers, dependent: :destroy

  def count
    trackers.pluck(:count).reduce(:+)
  end
end
