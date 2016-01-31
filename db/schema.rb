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

ActiveRecord::Schema.define(version: 20160131141436) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "analytes", force: :cascade do |t|
    t.integer  "branch_id",         limit: 4
    t.integer  "specie_profile_id", limit: 4
    t.integer  "code",              limit: 4
    t.string   "name",              limit: 255
    t.date     "birthdate"
    t.integer  "weight",            limit: 4
    t.string   "lanado",            limit: 255
    t.string   "color",             limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "analytes", ["branch_id"], name: "index_analytes_on_branch_id", using: :btree
  add_index "analytes", ["specie_profile_id"], name: "index_analytes_on_specie_profile_id", using: :btree

  create_table "branches", force: :cascade do |t|
    t.integer  "company_id",     limit: 4
    t.string   "alias",          limit: 255
    t.string   "cep",            limit: 255
    t.string   "number",         limit: 255
    t.string   "street_address", limit: 255
    t.string   "neighborhood",   limit: 255
    t.string   "city",           limit: 255
    t.string   "uf",             limit: 255
    t.string   "country",        limit: 255
    t.string   "complement",     limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "branches", ["company_id"], name: "index_branches_on_company_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "cnpj",        limit: 255
    t.string   "alias",       limit: 255
    t.string   "name",        limit: 255
    t.string   "logo",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",     limit: 4
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

  create_table "measures", force: :cascade do |t|
    t.float    "value",       limit: 24
    t.string   "unit",        limit: 255
    t.datetime "dateandtime"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "serie",       limit: 255
    t.string   "serie_label", limit: 255
    t.integer  "sampling_id", limit: 4
  end

  add_index "measures", ["sampling_id"], name: "index_measures_on_sampling_id", using: :btree

  create_table "samplings", force: :cascade do |t|
    t.integer  "analyte_id", limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "samplings", ["analyte_id"], name: "index_samplings_on_analyte_id", using: :btree

  create_table "specie_profiles", force: :cascade do |t|
    t.string   "especiename",             limit: 255
    t.string   "alias",                   limit: 255
    t.text     "description",             limit: 65535
    t.integer  "min_temperature",         limit: 4
    t.integer  "max_temperature",         limit: 4
    t.integer  "min_surface_temperature", limit: 4
    t.integer  "max_surface_temperature", limit: 4
    t.integer  "min_heart_frequency",     limit: 4
    t.integer  "min_relative_humidity",   limit: 4
    t.integer  "max_relative_humidity",   limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "analytes", "branches"
  add_foreign_key "analytes", "specie_profiles"
  add_foreign_key "branches", "companies"
  add_foreign_key "companies", "users"
  add_foreign_key "measures", "samplings"
  add_foreign_key "samplings", "analytes"
end
