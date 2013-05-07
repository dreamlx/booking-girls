class Girl < ActiveRecord::Base
  attr_accessible :age, :bwh, :desc, :name, :price, :state,:pics_attributes
  
  has_many :pics, as: :picable
  
  has_many :tasks
  
  accepts_nested_attributes_for :pics, allow_destroy: true, reject_if: :all_blank
  
  
  state_machine :state, initial: :pending do
    state :pending
    state :working
    state :getoff

    event :start_work do
      transition [:pending, :working] => :working
    end 
    
    event :complete_work do
      transition :working => :pending
    end
    
    event :get_off do
      transition :pending => :getoff
    end
    
    event :come_back do
      transition :getoff => :pending
    end    
  end
  
  def photo
    self.pics.first.photo
  end

end
