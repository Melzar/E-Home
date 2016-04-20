
class AccomodationTypeSerializer < ActiveModel::Serializer
  attributes :name
  has_many :accomodations
end