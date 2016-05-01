class CreateControlLogs < ActiveRecord::Migration
  def change
    create_table :control_logs do |t|
      t.references :control, null: false, foreign_key: true, foreign_key_name: 'Control_Control_Logs_FK'
      t.decimal :lux, precision: 15, scale: 5
      t.decimal :humidity, precision: 15, scale: 5
      t.decimal :temperature, precision: 15, scale: 5
      t.decimal :db, precision: 15, scale: 5
      t.decimal :watt, precision: 15, scale: 5
      t.decimal :network, precision: 15, scale: 5
      t.decimal :no_2, precision: 15, scale: 5
      t.decimal :co_2, precision: 15, scale: 5
      t.timestamps null: false
    end
  end
end
