class RenameTableServiceToServiceMenu < ActiveRecord::Migration
  def change
    rename_table :services, :service_menus
    rename_table :girls_services, :girls_service_menus
    rename_column :girls_service_menus, :service_id, :service_menu_id
  end
end
