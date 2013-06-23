class Task < ActiveRecord::Base
  attr_accessible :endtime, :girl_id, :starttime, :title, :intermediary, :price
  
  belongs_to :girl
  has_and_belongs_to_many :services
end
