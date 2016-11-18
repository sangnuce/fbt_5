class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :num_tourist
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_address
      t.text :description
      t.float :total_price
      t.integer :status
      t.belongs_to :tour, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
