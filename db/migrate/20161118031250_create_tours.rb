class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.float :price_per_person
      t.text :description
      t.integer :num_people
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :status
      t.float :discount
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
