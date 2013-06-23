class Service < ActiveRecord::Base
  attr_accessible :service_price, :service_name

  has_and_belongs_to_many :tasks

  def name_with_price
    if !self.service_price.nil? and !self.service_name.nil?
      "#{self.service_name}:#{sprintf("%05.2f", self.service_price)}"
    else
      return 0
    end
  end

end
