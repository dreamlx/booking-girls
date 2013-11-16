class MenuOrder < ActiveRecord::Base
  attr_accessible :customers, :desk, :user_id, :menu_items
  has_many :menu_items
end
