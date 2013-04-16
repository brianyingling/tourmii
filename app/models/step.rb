class Step < ActiveRecord::Base
  attr_accessible :name, :description, :address, :lat, :lng, :audiofile, :position, :tour_id
  belongs_to :tour
  has_many :statuses
  before_save :get_coords


  private
  def get_coords
    result = Geocoder.search(self.address).first
    if result.present?
      self.lat = result.latitude
      self.lng = result.longitude
    end
  end
end