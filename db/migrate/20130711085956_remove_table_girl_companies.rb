class RemoveTableGirlCompanies < ActiveRecord::Migration
  def change
    drop_table :company_girls
  end
end
