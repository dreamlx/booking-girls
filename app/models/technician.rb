class Technician < ActiveRecord::Base
  validates :name, presence: true
  
  attr_accessible :age, :bwh, 
    :desc, :name, 
    :price, :avatar, 
    :state,:pics_attributes, 
    :venue_ids, :service_menu_ids
  acts_as_commentable
  has_many :pics, as: :picable
  has_many :tasks

  has_and_belongs_to_many :service_menus

  has_many :work_relationships
  has_many :venues, through: :work_relationships, uniq: true

  accepts_nested_attributes_for :pics, allow_destroy: true, reject_if: :all_blank
  
  mount_uploader :avatar, AvatarUploader

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
  
  def photo
    self.avatar
  end

end
