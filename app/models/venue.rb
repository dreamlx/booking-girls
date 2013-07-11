class Venue < ActiveRecord::Base
  validates :name, :presence => true
  attr_accessible :address, :contact, :desc, :name, :company_id, :avatar

  has_and_belongs_to_many :girls
  belongs_to :company

  mount_uploader :avatar, AvatarUploader

end
