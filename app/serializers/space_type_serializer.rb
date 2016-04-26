class SpaceTypeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :spaces
end
