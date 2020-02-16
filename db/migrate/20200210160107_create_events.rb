class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :event_date
      t.float :fees
      t.timestamps
    end
  end
end
