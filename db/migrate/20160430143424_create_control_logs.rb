class CreateControlLogs < ActiveRecord::Migration
  def change
    create_table :control_logs do |t|
      t.references :control, null: false, foreign_key: true, foreign_key_name: 'Control_Control_Logs_FK'
      t.decimal :value, precision: 15, scale: 5
      t.timestamps null: false
    end
  end
end
