class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :name, :parent_id, :admin_user_id
  
  has_many :products, :order => 'created_at'
  has_many :menu_items

  belongs_to :admin_user
end
