class SpaceSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :accomodation
  belongs_to :space_type
end
