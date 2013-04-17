class Step < ActiveRecord::Base
  attr_accessible :name, :description, :address, :lat, :lng, :reference, :audiofile, :position, :tour_id
  belongs_to :tour
  has_many :statuses
  before_save :set_coords


  private
  def set_coords
    result = Geocoder.search(self.address).first
    if result.present?
      self.lat = result.latitude
      self.lng = result.longitude
    end
  end
end