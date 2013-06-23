class Service < ActiveRecord::Base
  attr_accessible :price, :service_name

  has_and_belongs_to_many :tasks

  def name_with_price
    "#{self.service_name}:#{sprintf("%05.2f", self.service_price)}"
  end

end
