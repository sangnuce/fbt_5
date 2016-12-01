class Like < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :likeable, polymorphic: true

  has_one :notification, as: :notifiable, dependent: :destroy
end
