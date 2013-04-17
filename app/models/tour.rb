class Tour < ActiveRecord::Base
  attr_accessible :name, :description, :reference, :lat, :lng, :image, :price, :tour_id
  has_many :steps
  has_many :orders
  belongs_to :user
  before_save :set_coords

  # returns the average of the latitude coords for all steps
  def get_average_lat
    (self.steps.map(&:lat).reduce(:+)) / steps.count
  end

  #  returns the average of the longitude coords for all steps
  def get_average_lng
    (self.steps.map(&:lng).reduce(:+)) / steps.count
  end

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