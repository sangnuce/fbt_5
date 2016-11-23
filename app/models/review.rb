class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tour

  has_many :likes, as: :likeable
  has_many :ratings, as: :rateable
  has_many :comments

  enum review_type: [:place, :food, :news]
end
