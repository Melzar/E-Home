class SpaceType < ActiveRecord::Base

  has_many :spaces

  validates :name,
            presence: true,
            length: { maximum: 100 }

end
