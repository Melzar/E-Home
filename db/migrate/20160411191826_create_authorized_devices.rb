class CreateAuthorizedDevices < ActiveRecord::Migration
  def change
    create_table :authorized_devices do |t|
      t.string :name, null: false, limit: 150
      t.string :os, limit: 100
      t.string :uuid, null: false, limit: 255
      t.references :customer, index: true
      t.timestamps null: false
    end

    add_foreign_key :authorized_devices,
                    :customers,
                    foreign_key: true,
                    name: 'Authorized_devices_Customers_Foreign_Key'
  end
end
