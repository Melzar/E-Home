class Accomodation < ActiveRecord::Base

  belongs_to :accomodation_type
  has_many :customers, through: :customer_accomodations
  has_many :authorized_devices, through: :customer_accomodations
  has_many :spaces

  validates :name,
            presence: true,
            length: { maximum: 150 }
  validates :address_1,
            presence: true,
            length: { maximum: 255 }
  validates :address_2,
            presence: true,
            length: { maximum: 50 }
  validates :city,
            presence: true,
            length: { maximum: 255 }
  validates :zip,
            presence: true,
            length: { maximum: 50 }
  validates :first_name,
            presence: true,
            length: { maximum: 100 }


end
