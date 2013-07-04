class Girl < ActiveRecord::Base
  validates :name, :presence => true
  after_save :set_relation
  attr_accessible :age, :bwh, :desc, :name, :price, :state,:pics_attributes, :venue_ids, :service_menu_ids
  acts_as_commentable
  has_many :pics, as: :picable
  has_many :tasks
  has_many :girl_venues
  has_and_belongs_to_many :service_menus
  has_many :venues, through: :girl_venues

  has_many :company_girls
  has_one :company, :through => :company_girls

  accepts_nested_attributes_for :pics, allow_destroy: true, reject_if: :all_blank
  
  state_machine :state, initial: :pending do
    state :pending
    state :working
    state :getoff
    state :booked

    event :book_me do
      transition :pending => :booked
    end 
    
    event :start_work do
      transition [:booked, :pending] => :working
    end 
    
    event :complete_work do
      transition :working => :pending
    end

    event :cancel_book do
      transition [:booked, :pending] => :pending
    end
    
    event :get_off do
      transition [:pending, :booked] => :getoff
    end
    
    event :come_back do
      transition :getoff => :pending
    end    
  end
  
  def set_relation
    company_girl = CompanyGirl.new
    company_girl.girl_id = self.id
    company_girl.company_id = User.current.company.id
    company_girl.save
  end
  
  def photo
    self.pics.blank? ? "" : self.pics.first.photo
  end

end
