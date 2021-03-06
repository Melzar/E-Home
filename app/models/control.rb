class Control < ActiveRecord::Base

  belongs_to :control_type
  belongs_to :space
  has_many :control_logs, dependent: :delete_all

  validates :control_type, presence: true
  validates :name, presence: true, length: {maximum: 255}
  validates :uuid, presence: true
  validates :status, presence: true

  enum status: [
      :healthy,
      :malfunctioned,
      :paused,
  ]

  scope :for_customer, -> (customer) {
    joins(:control_type)
        .includes(:control_type)
        .joins(:space)
        .includes(:space)
        .joins(space: [accomodation: :customer_accomodations])
        .where(customer_accomodations: {customer_id: customer.id})
  }


end
