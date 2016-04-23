
class AccomodationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_1, :address_2, :city, :zip, :latitude, :longitude
  has_many :customers, through: :customer_accomodations
  belongs_to :accomodation_type
end