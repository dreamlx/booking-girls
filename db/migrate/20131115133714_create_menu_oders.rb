class CreateMenuOrders < ActiveRecord::Migration
  def change
    create_table :menu_oders do |t|
      t.integer :user_id
      t.string  :desk
      t.integer :customers
      t.timestamps
    end
  end
end
