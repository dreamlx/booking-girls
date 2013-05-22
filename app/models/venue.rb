class Venue < ActiveRecord::Base
  attr_accessible :address, :contact, :desc, :name
  has_many :girl_venues
  has_many :girls, through: :girl_venues
end
