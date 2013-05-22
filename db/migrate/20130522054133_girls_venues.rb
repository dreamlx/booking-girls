class GirlsVenues < ActiveRecord::Migration
  def change
  	create_table :girl_venues do |t|
      t.integer :girl_id
      t.integer :venue_id
      
      t.timestamps
    end
  end
end
