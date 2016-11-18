class Place < ApplicationRecord
  has_closure_tree

  has_many :tour_places
end
