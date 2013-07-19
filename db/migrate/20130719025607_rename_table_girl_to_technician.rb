class RenameTableGirlToTechnician < ActiveRecord::Migration
  def change
  	rename_table :girls, :technicians
  end
end
