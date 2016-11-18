class BankCard < ApplicationRecord
  belongs_to :bank
  belongs_to :user

  has_many :payments
end
