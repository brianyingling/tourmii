class StepSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :lat, :lng, :reference, :is_complete
end