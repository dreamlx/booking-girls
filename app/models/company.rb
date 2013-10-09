class Company < ActiveRecord::Base
 	mount_uploader :avatar, AvatarUploader
  attr_accessible :address, :name, :phone, :avatar, :admin_user_id
  has_many :users
  belongs_to :admin_user
  
  has_many :venues
  has_many :service_menus

  has_many :technicians, :through => :venues, :uniq => true

  has_many :tasks, :through => :technicians, :uniq => true

  validates_presence_of :name
end
