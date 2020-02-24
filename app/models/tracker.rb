class Tracker < ApplicationRecord
  belongs_to :organisation

  def increment
    count += 1
  end
end
