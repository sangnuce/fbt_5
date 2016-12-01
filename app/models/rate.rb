class Rate < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :rater, class_name: User.name
  belongs_to :rateable, polymorphic: true

  has_one :notification, as: :notifiable, dependent: :destroy
end
