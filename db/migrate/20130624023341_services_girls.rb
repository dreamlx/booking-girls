class ServicesGirls < ActiveRecord::Migration
  def change
    create_table :girls_service_menus do |t|
      t.references :girl
      t.references :service_menu
    end
    add_index :girls_service_menus, :girl_id
    add_index :girls_service_menus, :service_menu_id
  end
end
