class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.belongs_to :user, foreign_key: true
      t.belongs_to :rateable, polymorphic: true

      t.timestamps
    end
  end
end
