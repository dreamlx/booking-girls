class Company < ActiveRecord::Base
  attr_accessible :address, :admin_id, :name, :phone
  belongs_to :admin, class_name: 'User', foreign_key: 'admin_id'
  
  has_many :venues
  has_many :service_menus

  has_many :company_girls
  has_many :girls, :through => :company_girls
end
