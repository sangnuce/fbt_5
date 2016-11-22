class Booking < ApplicationRecord
  belongs_to :tour_date
  belongs_to :user
end
