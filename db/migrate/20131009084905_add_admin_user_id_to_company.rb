class AddAdminUserIdToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :admin_user_id, :integer
  end
end
