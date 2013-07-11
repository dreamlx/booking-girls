class AddAvatarToGirl < ActiveRecord::Migration
  def change
    add_column :girls, :avatar, :string
  end
end
