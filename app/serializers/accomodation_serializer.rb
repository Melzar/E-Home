
class AccomodationSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_1, :address_2, :city, :zip, :latitude, :longitude
  has_many :customers, through: :customer_accomodations
  has_many :spaces
  belongs_to :accomodation_type
end