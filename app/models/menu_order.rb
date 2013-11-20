class MenuOrder < ActiveRecord::Base
  attr_accessible :customers, :desk, :staff_id
  has_many :menu_order_menu_itemships
  has_many :menu_items, :through => :menu_order_menu_itemships
end
