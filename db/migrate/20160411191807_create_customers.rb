class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name, null: false, limit: 100
      t.string :last_name, null: false, limit: 255
      t.string :phone_number, null: false, limit: 50
      t.string :address_1, null: false, limit: 255
      t.string :address_2, null: false, limit: 50
      t.string :city, null: false, limit: 255
      t.string :zip, null: false, limit: 50
      t.references :user, index: true
      t.timestamps null: false
    end

    add_foreign_key :customers,
                    :users,
                    foreign_key: true,
                    name: 'Customers_Users_Foreign_Key'
  end
end
