class AddCompanyIdToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :company_id, :integer
  end
end
