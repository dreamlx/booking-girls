class RenameTableGirlsServiceMenusToTechniciansServiceMenus < ActiveRecord::Migration
 	def change
 		rename_table :girls_service_menus, :technicians_service_menus
 		rename_column :technicians_service_menus, :girl_id, :technician_id
 		rename_column :tasks, :girl_id, :technician_id
	end
end
