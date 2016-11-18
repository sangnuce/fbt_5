class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :review_type
      t.text :content
      t.belongs_to :user, foreign_key: true
      t.belongs_to :tour, foreign_key: true

      t.timestamps
    end
  end
end
