class Category < ApplicationRecord
  acts_as_tree order: "created_at DESC"

  acts_as_paranoid

  has_closure_tree

  has_many :tours, dependent: :destroy
end
