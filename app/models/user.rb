class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable

  validates :name, presence: true, length: {maximum: 50}
  validates :phone, presence: true, numericality: true,
    length: {maximum: 11, minimum: 8}

  has_many :likes
  has_many :ratings
  has_many :reviews
  has_many :comments
  has_many :bookings
  has_many :bank_cards
end
