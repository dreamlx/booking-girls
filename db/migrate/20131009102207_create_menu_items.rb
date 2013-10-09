class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :title
      t.string :avatar
      t.decimal :price
      t.text :desc

      t.timestamps
    end
  end
end
