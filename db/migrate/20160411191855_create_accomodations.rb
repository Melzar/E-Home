class CreateAccomodations < ActiveRecord::Migration
  def change
    create_table :accomodations do |t|
      t.string :name, null: false, limit: 150
      t.string :address_1, null: false, limit: 255
      t.string :address_2, null: false, limit: 50
      t.string :city, null: false, limit: 255
      t.string :zip, null: false, limit: 50
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.references :accomodation_type, index: true
      t.timestamps null: false
    end

    add_foreign_key :accomodations,
                    :accomodation_types,
                    foreign_key: true,
                    name: 'Accomodations_Accomodation_types_Foreign_Key'
  end
end
