class ControlType < ActiveRecord::Base

  has_many :controls

  validates :name, presence: true, length: { maximum: 255 }

end