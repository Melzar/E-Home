class CreateControlLogs < ActiveRecord::Migration
  def change
    create_table :control_logs do |t|
      t.references :control, null: false
      t.decimal :lux, precision: 15, scale: 10
      t.decimal :humidity, precision: 15, scale: 10
      t.decimal :temperature, precision: 15, scale: 10
      t.decimal :db, precision: 15, scale: 10
      t.decimal :voltage, precision: 15, scale: 10
      t.decimal :network, precision: 15, scale: 10
      t.decimal :no_2, precision: 15, scale: 10
      t.decimal :co_2, precision: 15, scale: 10
      t.timestamps null: false
    end
  end
end
