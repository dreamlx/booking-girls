class MenuOrderMenuItemship < ActiveRecord::Base
  attr_accessible :menu_item_id, :menu_order_id
  belongs_to :menu_item
  belongs_to :menu_order
end
