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

ActiveRecord::Schema.define(version: 20150401202102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "cnpj"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "gateways", force: :cascade do |t|
    t.string   "ip"
    t.string   "url_connection"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lamps", force: :cascade do |t|
    t.string   "font_type"
    t.string   "font_subtype"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lamps", ["product_id"], name: "index_lamps_on_product_id", using: :btree

  create_table "networks", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "networks", ["company_id"], name: "index_networks_on_company_id", using: :btree

  create_table "networks_nodes", force: :cascade do |t|
    t.integer  "network_id"
    t.integer  "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "networks_nodes", ["network_id"], name: "index_networks_nodes_on_network_id", using: :btree
  add_index "networks_nodes", ["node_id"], name: "index_networks_nodes_on_node_id", using: :btree

  create_table "nodes", force: :cascade do |t|
    t.string   "identifier"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.string   "serial_number"
    t.string   "mac_address"
    t.string   "product_code"
    t.date     "fabrication_date"
    t.integer  "tension_operation"
    t.integer  "node_id"
    t.integer  "productable_id"
    t.string   "productable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["node_id"], name: "index_products_on_node_id", using: :btree
  add_index "products", ["productable_type", "productable_id"], name: "index_products_on_productable_type_and_productable_id", using: :btree

  create_table "user_levels", force: :cascade do |t|
    t.integer  "level"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_levels", ["user_id"], name: "index_user_levels_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "networks_nodes", "networks"
  add_foreign_key "networks_nodes", "nodes"
end
