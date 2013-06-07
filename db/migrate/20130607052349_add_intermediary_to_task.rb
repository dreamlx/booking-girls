class AddIntermediaryToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :intermediary, :string
  end
end
