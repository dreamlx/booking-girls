class Task < ActiveRecord::Base
  attr_accessible :endtime, :technician_id, :starttime, 
  	:title, :intermediary, 
  	:price, :service_menu_ids

  belongs_to :technician
  has_and_belongs_to_many :service_menus

  validates :price, :presence => true, numericality: true

end
