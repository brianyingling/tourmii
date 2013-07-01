class StepSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :lng, :reference
end