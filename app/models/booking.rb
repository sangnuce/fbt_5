class Booking < ApplicationRecord
  belongs_to :tour_date
  belongs_to :user

  validates :num_tourist, presence: true, numericality: true

  enum status: [:waiting_pay, :paid, :approve, :reject]
end
