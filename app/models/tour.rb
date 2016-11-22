class Tour < ApplicationRecord
  enum status: {available: true, unavailable: false}

  belongs_to :category

  has_many :ratings
  has_many :bookings
  has_many :tour_places

  scope :newest_tours, ->{order created_at: :desc}
  scope :hotest_tours, ->{left_joins(:bookings).group(:id).order "COUNT(bookings.id) DESC"}
  scope :cheapest_tours, ->{order price_per_person: :desc}
end
