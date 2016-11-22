class TourDate < ApplicationRecord
  belongs_to :tour

  has_many :bookings
end
