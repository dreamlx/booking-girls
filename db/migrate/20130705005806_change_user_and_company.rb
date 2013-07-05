class ChangeUserAndCompany < ActiveRecord::Migration
  def change
    add_column :users, :company_id, :integer
    remove_column :company, :user_id
  end
end
