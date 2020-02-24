class Subtracker < ApplicationRecord
  belongs_to :tracker

  def increment
    count += 1
  end
end
