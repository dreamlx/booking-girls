class AddStateToMenuList < ActiveRecord::Migration
  def change
    add_column :menu_lists, :state, :string
  end
end
