class Comment < ApplicationRecord
  acts_as_paranoid

  acts_as_tree order: "created_at DESC"

  belongs_to :review
  belongs_to :user

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :notifications, as: :target, dependent: :destroy

  scope :order_desc, ->{order created_at: :desc}

  validates :content, presence: true
end
