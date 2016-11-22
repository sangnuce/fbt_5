class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :code
      t.belongs_to :booking, foreign_key: true
      t.belongs_to :bank_card, foreign_key: true

      t.timestamps
    end
  end
end
