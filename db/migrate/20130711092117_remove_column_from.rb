class RemoveColumnFrom < ActiveRecord::Migration
  def change
  	remove_column :girls_venues, :created_at
  	remove_column :girls_venues, :updated_at
  end
end
