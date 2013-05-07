class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :name
      t.integer :age
      t.integer :price
      t.text :desc
      t.string :bwh
      t.string :state

      t.timestamps
    end
  end
end
