class CreateMenuOrders < ActiveRecord::Migration
  def up
    create_table :menu_orders do |t|
      t.string :desk
      t.integer :staff_id
      t.integer :customers

      t.timestamps
    end
  end

  def down
    drop_table :menu_orders
  end
end
