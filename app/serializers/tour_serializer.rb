class TourSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :steps
  embed :ids, :include=>true
end
