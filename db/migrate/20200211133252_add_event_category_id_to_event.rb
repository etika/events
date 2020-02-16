class AddEventCategoryIdToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :event_category_id, :integer
  end
end
