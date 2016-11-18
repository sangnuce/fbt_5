class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :place_type
      t.integer :parent_id

      t.timestamps
    end
  end
end
