class ControlTypeSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :controls
end
