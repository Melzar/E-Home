class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.references :control_type, null: false, foreign_key: true, foreign_key_name: 'Control_Control_Type_FK'
      t.string :name, null: false
      t.integer :status, null: false, default: 0
      t.string :uuid, null: false
      t.timestamps null: false
    end
  end
end
