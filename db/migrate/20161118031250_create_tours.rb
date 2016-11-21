class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.float :price_per_person
      t.text :description
      t.integer :num_people
      t.date :start_date
      t.date :end_date
      t.boolean :status, default: true
      t.float :discount, default: 0
      t.string :picture
      t.float :rating, default: 0
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
