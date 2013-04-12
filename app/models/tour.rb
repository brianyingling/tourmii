class Tour < ActiveRecord::Base
  attr_accessible :name, :description, :lat, :lng, :image, :price, :tour_id
  has_many :steps
  has_many :orders
  belongs_to :user
end