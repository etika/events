class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
      t.integer :event_id
      t.integer :user_id
      t.boolean :attend

      t.timestamps
    end
  end
end
