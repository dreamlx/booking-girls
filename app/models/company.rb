class Company < ActiveRecord::Base
 	mount_uploader :avatar, AvatarUploader
  attr_accessible :address, :name, :phone, :avatar
  has_many :users
  
  has_many :venues
  has_many :service_menus

  has_many :technicians, :through => :venues, :uniq => true

  has_many :tasks, :through => :technicians, :uniq => true

  validates_presence_of :name
end
