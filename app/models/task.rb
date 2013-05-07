class Task < ActiveRecord::Base
  attr_accessible :endtime, :girl_id, :starttime, :title
  
  belongs_to :girl
end
