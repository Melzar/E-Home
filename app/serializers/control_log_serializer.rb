class ControlLogSerializer < ActiveModel::Serializer
  attributes :id, :lux, :humidity, :temperature, :db, :voltage, :network, :no_2, :co_2

  belongs_to :control
end
