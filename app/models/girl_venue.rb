class GirlVenue < ActiveRecord::Base
  attr_accessible :girl_id, :venue_id
  belongs_to :girl
  belongs_to :venue
  
end