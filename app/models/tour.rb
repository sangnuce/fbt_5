class Tour < ApplicationRecord
  enum status: {available: true, unavailable: false}

  belongs_to :category

  has_many :ratings
  has_many :bookings
  has_many :tour_places

  scope :order_time_desc, ->{order created_at: :desc}
  scope :order_bookings_desc, ->{left_joins(:bookings).group(:id).order "COUNT(bookings.id) DESC"}
end
