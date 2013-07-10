class ServiceMenu < ActiveRecord::Base
  attr_accessible :service_name, :service_price, :company_id, :avatar
  validates_presence_of :service_name, :service_price
  validates_numericality_of :service_price
  mount_uploader :avatar, AvatarUploader
  
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :girls
  belongs_to :company

  def name_with_price
    if !self.service_price.nil? and !self.service_name.nil?
      "#{self.service_name}:#{sprintf("%05.2f", self.service_price)}"
    else
      return 0
    end
  end
end
