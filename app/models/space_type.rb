class SpaceType < ActiveRecord::Base

  has_many :spaces

  validates :type,
            presence: true,
            length: { maximum: 100 }

end
