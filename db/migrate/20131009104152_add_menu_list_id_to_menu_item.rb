class AddMenuListIdToMenuItem < ActiveRecord::Migration
  def change
    add_column :menu_items, :menu_list_id, :integer
  end
end
