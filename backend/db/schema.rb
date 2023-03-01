# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_01_050306) do

  create_table "airbnbs", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "size"
    t.integer "price"
    t.integer "host_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["host_id"], name: "index_airbnbs_on_host_id"
  end

  create_table "descriptions", force: :cascade do |t|
    t.text "description"
    t.integer "airbnb_id", null: false
    t.integer "host_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airbnb_id"], name: "index_descriptions_on_airbnb_id"
    t.index ["host_id"], name: "index_descriptions_on_host_id"
  end

  create_table "hosts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.integer "airbnb_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airbnb_id"], name: "index_images_on_airbnb_id"
  end

  add_foreign_key "airbnbs", "hosts"
  add_foreign_key "descriptions", "airbnbs"
  add_foreign_key "descriptions", "hosts"
  add_foreign_key "images", "airbnbs"
end