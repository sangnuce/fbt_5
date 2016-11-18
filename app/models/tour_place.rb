class TourPlace < ApplicationRecord
  belongs_to :tour
  belongs_to :place
end
