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

ActiveRecord::Schema.define(version: 20170721015756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "age_ranges", force: :cascade do |t|
    t.string "name"
    t.integer "min"
    t.integer "max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classifications", force: :cascade do |t|
    t.bigint "vehicle_class_id"
    t.bigint "sub_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_type_id"], name: "index_classifications_on_sub_type_id"
    t.index ["vehicle_class_id"], name: "index_classifications_on_vehicle_class_id"
  end

  create_table "document_types", force: :cascade do |t|
    t.string "name"
    t.string "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insurances", force: :cascade do |t|
    t.bigint "vehicle_id"
    t.date "start_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_insurances_on_vehicle_id"
  end

  create_table "rates", force: :cascade do |t|
    t.integer "code"
    t.bigint "classification_id"
    t.bigint "age_range_id"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["age_range_id"], name: "index_rates_on_age_range_id"
    t.index ["classification_id"], name: "index_rates_on_classification_id"
  end

  create_table "sub_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "system_params", force: :cascade do |t|
    t.string "key"
    t.string "value_type"
    t.string "value"
    t.string "version"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.float "value"
    t.datetime "capture_at"
    t.bigint "user_id"
    t.bigint "insurance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insurance_id"], name: "index_transactions_on_insurance_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "document_type_id"
    t.string "document_number"
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_users_on_document_type_id"
  end

  create_table "vehicle_classes", force: :cascade do |t|
    t.string "name"
    t.boolean "has_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "registration_number"
    t.bigint "classification_id"
    t.integer "release_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_vehicles_on_classification_id"
  end

  add_foreign_key "classifications", "sub_types"
  add_foreign_key "classifications", "vehicle_classes"
  add_foreign_key "insurances", "vehicles"
  add_foreign_key "rates", "age_ranges"
  add_foreign_key "rates", "classifications"
  add_foreign_key "transactions", "users"
  add_foreign_key "users", "document_types"
  add_foreign_key "vehicles", "classifications"
end
