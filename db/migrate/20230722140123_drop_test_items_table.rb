class DropTestItemsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :test_items
  end
end
