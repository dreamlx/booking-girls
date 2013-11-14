class AddDescToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :desc, :string
  end
end
