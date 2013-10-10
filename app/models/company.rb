class Company < ActiveRecord::Base
 	mount_uploader :avatar, AvatarUploader
  attr_accessible :address, :name, :phone, :avatar, :admin_user_id, :pics_attributes
  has_many :users
  belongs_to :admin_user
  
  has_many :venues
  has_many :service_menus

  has_many :technicians, :through => :venues, :uniq => true

  has_many :tasks, :through => :technicians, :uniq => true

  validates_presence_of :name
  
  has_many :pics, as: :picable
  accepts_nested_attributes_for :pics, allow_destroy: true, reject_if: :all_blank

end
