class Control < ActiveRecord::Base

  belongs_to :control_type
  belongs_to :space
  has_many :control_logs


  validates :control_type, presence: true
  validates :name, presence: true, length: {maximum: 255}
  validates :uuid, presence: true
  validates :status, presence: true

  enum status: [
      :disabled,
      :enabled
  ]

  scope :for_customer, -> (customer) {
    joins(:control_type)
        .includes(:control_type)
        .joins(:space)
        .includes(:space)
        .joins(:accomodation)
        .joins(accomodation: :customer_accomodaton)
        .where(customer_accomodation: {customer_id: customer.id})
  }


end
