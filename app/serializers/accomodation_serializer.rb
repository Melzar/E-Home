
class AccomodationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_1, :address_2, :city, :zip, :latitude, :longitude
  belongs_to :accomodation_type
end