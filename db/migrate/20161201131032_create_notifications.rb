class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :notifier_id
      t.integer :notified_id
      t.belongs_to :notifiable, polymorphic: true
      t.belongs_to :target, polymorphic: true
      t.boolean :is_new, default: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
