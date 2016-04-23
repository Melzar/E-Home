class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :user
  has_many :accomodations, through: :customer_accomodations
end
