class ServiceMenu < ActiveRecord::Base
  attr_accessible :service_name, :service_price, :company_id, :avatar, :desc, :pics_attributes
  validates_presence_of :service_name, :service_price, :avatar
  validates_numericality_of :service_price
  mount_uploader :avatar, AvatarUploader
  
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :technicians
  belongs_to :company

  has_many :pics, as: :picable
  accepts_nested_attributes_for :pics, allow_destroy: true, reject_if: :all_blank

  def name_with_price
    if !self.service_price.nil? and !self.service_name.nil?
      "#{self.service_name}:#{sprintf("%05.2f", self.service_price)}"
    else
      return 0
    end
  end
end
