class CreateControlTypes < ActiveRecord::Migration
  def change
    create_table :control_types do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
