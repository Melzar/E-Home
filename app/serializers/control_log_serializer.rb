class ControlLogSerializer < ActiveModel::Serializer
  attributes :id, :lux, :humidity, :temperature, :db, :watt, :network, :no_2, :co_2, :created_at

  belongs_to :control
end
