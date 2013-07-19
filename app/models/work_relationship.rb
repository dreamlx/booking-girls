class WorkRelationship < ActiveRecord::Base
  attr_accessible :technician_id, :venue_id

  belongs_to :technician
  belongs_to :venue
end