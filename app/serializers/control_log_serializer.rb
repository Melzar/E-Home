class ControlLogSerializer < ActiveModel::Serializer
  attributes :id, :value, :created_at
  belongs_to :control
end
