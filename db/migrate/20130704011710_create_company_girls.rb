class CreateCompanyGirls < ActiveRecord::Migration
  def change
    create_table :company_girls do |t|
      t.references :company
      t.references :girl
    end
    add_index :company_girls, :girl_id
    add_index :company_girls, :company_id
  end
end

