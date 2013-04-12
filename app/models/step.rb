class Step < ActiveRecord::Base
  attr_accessible :name, :description, :address, :lat, :lng, :audiofile, :position, :tour_id
  belongs_to :tour
  has_many :statuses
end