class RenameTableGirlToTechnician < ActiveRecord::Migration
  def change
  	rename_column :work_relationships, :girl_id, :technician_id
  end
end
