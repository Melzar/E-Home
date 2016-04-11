class AuthorizedDevice < ActiveRecord::Base

  belongs_to :customer
  has_many :accomodations, through: :customer_accomodations

  validates :name,
            presence: true,
            length: { maximum: 150 }
  validates :os,
            length: { maximum: 100 }
  validates :uuid,
            presence: true,
            length: { maximum: 255 }

end
