class AddAdminUserIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :admin_user_id, :integer
    add_column :menu_items, :admin_user_id, :integer
    add_column :menu_lists, :admin_user_id, :integer
  end
end
