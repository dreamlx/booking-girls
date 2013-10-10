class MenuItem < ActiveRecord::Base
  validates_presence_of :title, :price
  attr_accessible :avatar, :desc, :price, :title, :menu_list_id, :category_id
  mount_uploader :avatar, AvatarUploader
  belongs_to :menu_list
  belongs_to :category

end
