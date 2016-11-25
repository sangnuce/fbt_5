class Booking < ApplicationRecord
  belongs_to :tour_date
  belongs_to :user

  enum status: [:waiting_pay, :paid, :approve, :reject]

  validates :contact_name, presence: true
  validates :num_tourist, presence: true, numericality: true
  validates :contact_phone, presence: true, numericality: true,
    length: {maximum: 11, minimum: 8}
end
