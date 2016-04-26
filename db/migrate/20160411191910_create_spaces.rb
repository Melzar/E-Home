class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, null: false, limit: 150
      t.references :accomodation, foreign_key: true, foreign_key_name: 'Space_Accomodation_Foreign_Key'
      t.references :space_type, foreign_key: true, foreign_key_name: 'Space_Space_types_Foreign_Key'
      t.timestamps null: false
    end
  end
end
