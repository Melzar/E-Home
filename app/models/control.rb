class Control < ActiveRecord::Base

  belongs_to :control_type
  has_many :control_logs

  validates :control_type, presence: true
  validates :name, presence: true, length: {maximum: 255}
  validates :uuid, presence: true
  validates :status, presence: true

  enum status: [
      :disabled,
      :enabled
  ]

  validates :name
end
