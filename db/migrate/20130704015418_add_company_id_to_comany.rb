class AddCompanyIdToComany < ActiveRecord::Migration
  def change
    add_column :service_menus, :company_id, :integer
  end
end
