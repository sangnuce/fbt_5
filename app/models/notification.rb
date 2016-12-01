class Notification < ApplicationRecord
  acts_as_paranoid

  belongs_to :notifier, class_name: User.name
  belongs_to :notified, class_name: User.name
  belongs_to :notifiable, polymorphic: true
  belongs_to :target, polymorphic: true

  scope :new_notifications, ->{where is_new: true}
  scope :order_created_desc, ->{order created_at: :desc}
end
