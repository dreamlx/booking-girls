class MenuOrder < ActiveRecord::Base
  attr_accessible :customers, :desk, :staff_id, :menu_order_menu_itemships
  has_many :menu_order_menu_itemships
  has_many :menu_items, :through => :menu_order_menu_itemships
  belongs_to :waiter, foreign_key: :staff_id, class_name: 'User'

  accepts_nested_attributes_for :menu_order_menu_itemships, reject_if: :all_blank, allow_destroy: true

  def total_price
    self.menu_items.sum(:price)
  end
end
