class Company < ActiveRecord::Base
  attr_accessible :address, :name, :phone
  has_many :users
  
  has_many :venues
  has_many :service_menus

  has_many :company_girls
  has_many :girls, :through => :company_girls

  has_many :tasks, :through => :girls

  validates_presence_of :name
end
