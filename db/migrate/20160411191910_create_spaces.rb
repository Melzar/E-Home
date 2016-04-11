class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name, null: false, limit: 150
      t.references :space_type, index: true
      t.timestamps null: false
    end

    add_foreign_key :spaces,
                    :space_types,
                    foreign_key: true,
                    name: 'Space_Space_types_Foreign_Key'
  end
end
