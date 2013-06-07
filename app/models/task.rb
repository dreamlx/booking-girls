class Task < ActiveRecord::Base
  attr_accessible :endtime, :girl_id, :starttime, :title, :intermediary, :price
  
  belongs_to :girl
end
