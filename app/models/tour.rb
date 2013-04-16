class Tour < ActiveRecord::Base
  attr_accessible :name, :description, :lat, :lng, :image, :price, :tour_id
  has_many :steps
  has_many :orders
  belongs_to :user
  before_save :set_coords


  private
  def set_coords
    if self.steps.first.present?
      result = Geocoder.search(self.steps.first.address).first
      if result.present?
        self.lat = result.latitude
        self.lng = result.longitude
      end
    end
  end
end