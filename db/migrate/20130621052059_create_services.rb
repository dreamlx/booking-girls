class CreateServices < ActiveRecord::Migration
  def change
    create_table :service_menus do |t|
      t.string :service_name
      t.decimal :service_price

      t.timestamps
    end
  end
end
