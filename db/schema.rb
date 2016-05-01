# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160430143424) do

  create_table "accomodation_types", force: :cascade do |t|
    t.string   "name",       limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "accomodations", force: :cascade do |t|
    t.string   "name",                 limit: 150,                          null: false
    t.string   "address_1",            limit: 255,                          null: false
    t.string   "address_2",            limit: 50,                           null: false
    t.string   "city",                 limit: 255,                          null: false
    t.string   "zip",                  limit: 50,                           null: false
    t.decimal  "latitude",                         precision: 10, scale: 6
    t.decimal  "longitude",                        precision: 10, scale: 6
    t.integer  "accomodation_type_id", limit: 4
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  add_index "accomodations", ["accomodation_type_id"], name: "index_accomodations_on_accomodation_type_id", using: :btree

  create_table "authorized_devices", force: :cascade do |t|
    t.string   "name",        limit: 150, null: false
    t.string   "os",          limit: 100
    t.string   "uuid",        limit: 255, null: false
    t.integer  "customer_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "authorized_devices", ["customer_id"], name: "index_authorized_devices_on_customer_id", using: :btree

  create_table "control_logs", force: :cascade do |t|
    t.integer  "control_id",  limit: 4,                           null: false
    t.decimal  "lux",                   precision: 15, scale: 10
    t.decimal  "humidity",              precision: 15, scale: 10
    t.decimal  "temperature",           precision: 15, scale: 10
    t.decimal  "db",                    precision: 15, scale: 10
    t.decimal  "voltage",               precision: 15, scale: 10
    t.decimal  "network",               precision: 15, scale: 10
    t.decimal  "no_2",                  precision: 15, scale: 10
    t.decimal  "co_2",                  precision: 15, scale: 10
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "control_logs", ["control_id"], name: "fk_rails_c7598992b2", using: :btree

  create_table "control_types", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "controls", force: :cascade do |t|
    t.integer  "control_type_id", limit: 4,               null: false
    t.string   "name",            limit: 255,             null: false
    t.integer  "status",          limit: 4,   default: 0, null: false
    t.string   "uuid",            limit: 255,             null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "controls", ["control_type_id"], name: "fk_rails_4d5683c4c2", using: :btree

  create_table "customer_accomodations", force: :cascade do |t|
    t.integer  "customer_id",          limit: 4
    t.integer  "authorized_device_id", limit: 4
    t.integer  "accomodation_id",      limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "customer_accomodations", ["accomodation_id"], name: "index_customer_accomodations_on_accomodation_id", using: :btree
  add_index "customer_accomodations", ["authorized_device_id"], name: "index_customer_accomodations_on_authorized_device_id", using: :btree
  add_index "customer_accomodations", ["customer_id"], name: "index_customer_accomodations_on_customer_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",   limit: 100, null: false
    t.string   "last_name",    limit: 255, null: false
    t.string   "phone_number", limit: 50,  null: false
    t.string   "address_1",    limit: 255, null: false
    t.string   "address_2",    limit: 50,  null: false
    t.string   "city",         limit: 255, null: false
    t.string   "zip",          limit: 50,  null: false
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "space_types", force: :cascade do |t|
    t.string   "name",       limit: 100, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "name",            limit: 150, null: false
    t.integer  "accomodation_id", limit: 4
    t.integer  "space_type_id",   limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "spaces", ["accomodation_id"], name: "fk_rails_28c71d56a7", using: :btree
  add_index "spaces", ["space_type_id"], name: "fk_rails_b80275384e", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "authentication_token",   limit: 255
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "accomodations", "accomodation_types", name: "Accomodations_Accomodation_types_Foreign_Key"
  add_foreign_key "authorized_devices", "customers", name: "Authorized_devices_Customers_Foreign_Key"
  add_foreign_key "control_logs", "controls"
  add_foreign_key "controls", "control_types"
  add_foreign_key "customer_accomodations", "authorized_devices", name: "Customers_Accomodations_Authorized_Devices_Foreign_Key"
  add_foreign_key "customer_accomodations", "customers", name: "Customers_Accomodations_Accomodations_Foreign_Key"
  add_foreign_key "customer_accomodations", "customers", name: "Customers_Accomodations_Customers_Foreign_Key"
  add_foreign_key "customers", "users", name: "Customers_Users_Foreign_Key"
  add_foreign_key "spaces", "accomodations"
  add_foreign_key "spaces", "space_types"
  add_foreign_key "users", "roles", name: "Users_Roles_Foreign_Key"
end
