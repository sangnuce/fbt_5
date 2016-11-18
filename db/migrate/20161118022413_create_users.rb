class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :avatar
      t.boolean :is_admin

      t.timestamps
    end
  end
end
