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

ActiveRecord::Schema.define(version: 20150728173659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "firmwares", force: :cascade do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_content"
    t.string   "checksum"
    t.float    "version"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "gateways", force: :cascade do |t|
    t.string   "ip"
    t.string   "url_connection"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "lamp_stats", force: :cascade do |t|
    t.integer  "serial_num",     limit: 8
    t.datetime "date"
    t.integer  "pwr",            limit: 2
    t.float    "current"
    t.float    "volts"
    t.float    "tCom"
    t.float    "tLed1"
    t.float    "tLed2"
    t.integer  "sLum"
    t.integer  "rssiDev",        limit: 2
    t.integer  "lqiDev",         limit: 2
    t.integer  "correlationDev", limit: 2
    t.integer  "rssi",           limit: 2
    t.integer  "lqi",            limit: 2
    t.integer  "correlation",    limit: 2
    t.integer  "sentPkts",       limit: 8
    t.integer  "rcvPkts",        limit: 8
    t.integer  "lastReboot",     limit: 8
    t.integer  "txPwr",          limit: 2
    t.integer  "ctrlRestart",    limit: 8
    t.integer  "vFirmware",      limit: 2
    t.integer  "vCmd"
    t.integer  "cksCfg"
    t.integer  "appCksErr"
    t.integer  "cmdNotImp"
    t.boolean  "online"
    t.boolean  "communicating"
    t.string   "sunrise",        limit: 40
    t.string   "sunset",         limit: 40
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "lamp_stats", ["serial_num"], name: "index_lamp_stats_on_serial_num", using: :btree

  create_table "lamps", force: :cascade do |t|
    t.string   "font_type"
    t.string   "font_subtype"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "networks", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "networks", ["company_id"], name: "index_networks_on_company_id", using: :btree

  create_table "nodes", force: :cascade do |t|
    t.string   "identifier"
    t.integer  "network_id"
    t.decimal  "latitude",   precision: 10, scale: 6
    t.decimal  "longitude",  precision: 10, scale: 6
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "nodes", ["network_id"], name: "index_nodes_on_network_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.string   "resource"
    t.integer  "ability"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "permissions", ["role_id"], name: "index_permissions_on_role_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.integer  "serial_number",     limit: 8, null: false
    t.string   "mac_address"
    t.integer  "product_code"
    t.integer  "product_revision"
    t.date     "fabrication_date"
    t.integer  "tension_operation"
    t.integer  "node_id"
    t.integer  "company_id",                  null: false
    t.integer  "productable_id"
    t.string   "productable_type"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "products", ["company_id"], name: "index_products_on_company_id", using: :btree
  add_index "products", ["node_id"], name: "index_products_on_node_id", using: :btree
  add_index "products", ["productable_type", "productable_id"], name: "index_products_on_productable_type_and_productable_id", using: :btree
  add_index "products", ["serial_number"], name: "index_products_on_serial_number", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["company_id"], name: "index_roles_on_company_id", using: :btree

  create_table "tag_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "exclusive"
    t.integer  "ability"
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tag_types", ["company_id"], name: "index_tag_types_on_company_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "company_id"
    t.integer  "role_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "name",                   limit: 30
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "permissions", "roles"
  add_foreign_key "roles", "companies"
  add_foreign_key "tag_types", "companies"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "roles"
end
