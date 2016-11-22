class Place < ApplicationRecord
  enum place_type: {region: 0, city: 1, place: 2}

  has_closure_tree

  has_many :tour_places
  has_many :tours, through: :tour_places

  scope :popular_desc, ->{left_joins(:tour_places).group(:id).order "COUNT(tour_id) DESC"}
end
