class User < ApplicationRecord
  has_many :likes
  has_many :ratings
  has_many :reviews
  has_many :comments
  has_many :bookings
  has_many :bank_cards
end
