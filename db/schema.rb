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

ActiveRecord::Schema.define(version: 2019_05_03_173905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotline_numbers", force: :cascade do |t|
    t.string "phone_number"
    t.bigint "transplant_center_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transplant_center_id"], name: "index_hotline_numbers_on_transplant_center_id"
  end

  create_table "incoming_calls", force: :cascade do |t|
    t.string "call_sid"
    t.string "called"
    t.string "call_status"
    t.string "from"
    t.string "from_number"
    t.string "from_city"
    t.string "from_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hotline_number_id"
    t.datetime "call_time"
    t.index ["hotline_number_id"], name: "index_incoming_calls_on_hotline_number_id"
  end

  create_table "sign_ups", force: :cascade do |t|
    t.string "email_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transplant_centers", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "area_code"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  add_foreign_key "hotline_numbers", "transplant_centers"
  add_foreign_key "incoming_calls", "hotline_numbers"
end
