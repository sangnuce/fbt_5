class Tour < ApplicationRecord
  enum status: {available: true, unavailable: false}

  acts_as_paranoid

  ratyrate_rateable :quality

  belongs_to :category

  has_many :reviews, dependent: :destroy
  has_many :tour_dates, dependent: :destroy
  has_many :tour_places, dependent: :destroy
  has_many :bookings, through: :tour_dates
  has_many :places, through: :tour_places

  scope :newest_tours, ->{order created_at: :desc}
  scope :hotest_tours, -> do
    left_joins(:bookings).group(:id).order "COUNT(bookings.id) DESC"
  end
  scope :cheapest_tours, ->{order price_per_person: :desc}
  scope :price_between, -> from, to do
    if from.present? && to.present?
      where "price_per_person BETWEEN ? AND ?", from, to
    end
  end
  scope :rating_order, ->rule {order(rating: rule) if rule.present?}
  scope :price_order, ->rule {order(price_per_person: rule) if rule.present?}

  validates :discount, presence: true,
    numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
end
