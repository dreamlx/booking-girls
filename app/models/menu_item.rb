class MenuItem < ActiveRecord::Base
  attr_accessible :avatar, :desc, :price, :title, :menu_list_id

  belongs_to :menu_list
  belongs_to :category
end
