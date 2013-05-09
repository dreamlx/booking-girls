class CreateDicts < ActiveRecord::Migration
  def change
    create_table :dicts do |t|
      t.string :title
      t.string :category
      t.string :value

      t.timestamps
    end
  end
end
