class RenameTableServiceMenus < ActiveRecord::Migration
	def change
		rename_table :technicians_service_menus, :service_menus_technicians
	end
end
