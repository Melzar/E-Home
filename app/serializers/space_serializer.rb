class SpaceSerializer < BaseSerializer
  attributes :id, :name
  belongs_to :accomodation
  belongs_to :space_type
  has_many :controls
end
