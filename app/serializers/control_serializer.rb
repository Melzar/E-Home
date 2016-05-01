class ControlSerializer < ActiveModel::Serializer
  attributes :id, :name, :state, :status, :uuid

  belongs_to :control_type
  has_many :control_logs
  belongs_to :space
end
