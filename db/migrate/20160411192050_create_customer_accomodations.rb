class CreateCustomerAccomodations < ActiveRecord::Migration
  def change
    create_table :customer_accomodations do |t|
      t.references :customer, index: true
      t.references :authorized_device, index: true
      t.references :accomodation, index: true
      t.timestamps null: false
    end

    add_foreign_key  :customer_accomodations,
                     :customers,
                     foreign_key: true,
                     name: 'Customers_Accomodations_Customers_Foreign_Key'
    add_foreign_key  :customer_accomodations,
                     :authorized_devices,
                     foreign_key: true,
                     name: 'Customers_Accomodations_Authorized_Devices_Foreign_Key'
    add_foreign_key  :customer_accomodations,
                     :customers,
                     foreign_key: true,
                     name: 'Customers_Accomodations_Accomodations_Foreign_Key'
  end
end
