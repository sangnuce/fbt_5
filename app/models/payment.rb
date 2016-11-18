class Payment < ApplicationRecord
  belongs_to :booking
  belongs_to :bank_card
end
