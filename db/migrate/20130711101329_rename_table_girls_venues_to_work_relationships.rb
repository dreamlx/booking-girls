class RenameTableGirlsVenuesToWorkRelationships < ActiveRecord::Migration
  def change
  	rename_table :girls_venues, :work_relationships
  end
end
