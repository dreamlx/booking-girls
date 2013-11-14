class Company < ActiveRecord::Base
 	mount_uploader :avatar, AvatarUploader
  attr_accessible :address, 
                  :name, 
                  :phone, 
                  :avatar, 
                  :desc,
                  :admin_user_id, 
                  :pics_attributes
  
  belongs_to :admin_user
  
  has_many :users  
  has_many :venues
  has_many :service_menus
  has_many :technicians, :through => :venues, :uniq => true
  has_many :tasks, :through => :technicians, :uniq => true
  
  has_many :pics, as: :picable
  accepts_nested_attributes_for :pics, allow_destroy: true, reject_if: :all_blank

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :admin_user_id

  extend FriendlyId
  friendly_id :name, use: :slugged
end
