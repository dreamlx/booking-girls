class AddDescToServiceMenu < ActiveRecord::Migration
  def change
    add_column :service_menus, :desc, :text
  end
end
