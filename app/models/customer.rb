class Customer < ActiveRecord::Base

  belongs_to :user
  has_many :authorized_devices
  has_many :accomodations, through: :customer_accomodations

  validates :first_name,
            presence: true,
            length: { maximum: 100 }
  validates :last_name,
            presence: true,
            length: { maximum: 255 }
  validates :phone_number,
            presence: true,
            length: { maximum: 50 }
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

end
