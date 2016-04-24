class CreateAccomodationTypes < ActiveRecord::Migration
  def change
    create_table :accomodation_types do |t|
      t.string :name, null: false, limit: 100
      t.timestamps null: false
    end
  end
end
