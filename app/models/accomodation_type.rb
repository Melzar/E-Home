class AccomodationType < ActiveRecord::Base

  has_many :accomodations

  validates :name,
            presence: true,
            length: { maximum: 100 }

end
