class AddAvatarToServiceMenus < ActiveRecord::Migration
  def change
    add_column :service_menus, :avatar, :string
  end
end
