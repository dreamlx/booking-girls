class ServicesGirls < ActiveRecord::Migration
  def change
    create_table :girl_services do |t|
      t.references :girl
      t.references :service
    end
    add_index :girls_services, :girl_id
    add_index :girls_services, :service_id
  end
end
