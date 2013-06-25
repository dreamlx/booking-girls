class ServicesGirls < ActiveRecord::Migration
  def change
    create_table :girls_services do |t|
      t.references :girl
      t.references :service_menu
    end
    add_index :girls_services, :girl_id
    add_index :girls_services, :service_menu_id
  end
end
