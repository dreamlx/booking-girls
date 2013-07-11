class RenameTableGirlVenuesToGirlsVenues < ActiveRecord::Migration
  def change
  	rename_table :girl_venues, :girls_venues
  end
end
