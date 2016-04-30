class Space < ActiveRecord::Base

  belongs_to :space_type
  belongs_to :accomodation

  validates :name,
            presence: true,
            length: { maximum: 150 }

  validates :space_type,
            presence: true

  validates :accomodation,
            presence: true

  scope :for_customer, -> (customer){
    joins(:space_type)
    .joins(:accomodation)
    .joins(accomodation: :customer_accomodations)
    .where(customer_accomodations: {customer_id: customer})
  }

end
