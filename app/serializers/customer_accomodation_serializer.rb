class CustomerAccomodationSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :customer
  belongs_to :accomodation
end
