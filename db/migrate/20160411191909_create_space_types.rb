class CreateSpaceTypes < ActiveRecord::Migration
  def change
    create_table :space_types do |t|
      t.string :type, null: false, limit: 100
      t.timestamps null: false
    end
  end
end
