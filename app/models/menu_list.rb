class MenuList < ActiveRecord::Base
  attr_accessible :company, :desc, :title
  has_many :menu_items
end
