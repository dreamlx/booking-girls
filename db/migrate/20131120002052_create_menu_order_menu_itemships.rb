class CreateMenuOrderMenuItemships < ActiveRecord::Migration
  def change
    create_table :menu_order_menu_itemships do |t|
      t.integer :menu_order_id
      t.integer :menu_item_id

      t.timestamps
    end
  end
end
