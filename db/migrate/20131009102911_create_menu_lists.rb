class CreateMenuLists < ActiveRecord::Migration
  def change
    create_table :menu_lists do |t|
      t.string :title
      t.text :desc
      t.integer :company_id

      t.timestamps
    end
  end
end
