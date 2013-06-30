class StepSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address, :position
end
