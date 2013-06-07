class AddPriceToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :price, :decimal
  end
end
