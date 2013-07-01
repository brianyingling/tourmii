class TourSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :steps

  # use has_one instead of belongs_to -- JSON isn't
  # concerned with ownership
  has_one :user
end
