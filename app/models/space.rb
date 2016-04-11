class Space < ActiveRecord::Base

  belongs_to :space_type
  belongs_to :accomodation

  validates :name,
            presence: true,
            length: { maximum: 150 }

end
