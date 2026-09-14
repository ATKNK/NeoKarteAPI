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

ActiveRecord::Schema[8.1].define(version: 2026_09_14_033216) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "capitals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.boolean "enddate_approximate"
    t.string "name"
    t.bigint "political_era_id", null: false
    t.date "start_date"
    t.boolean "startdate_approximate"
    t.datetime "updated_at", null: false
    t.index ["political_era_id"], name: "index_capitals_on_political_era_id"
  end

  create_table "constellations", force: :cascade do |t|
    t.string "abbreviation"
    t.string "adjective"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "tag"
    t.datetime "updated_at", null: false
  end

  create_table "dynasties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "government_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "political_eras", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.bigint "dynasty_id", null: false
    t.date "end_date"
    t.boolean "enddate_approximate"
    t.string "full_name"
    t.string "full_name_local"
    t.bigint "government_type_id", null: false
    t.string "name"
    t.date "start_date"
    t.boolean "startdate_approximate"
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_political_eras_on_country_id"
    t.index ["dynasty_id"], name: "index_political_eras_on_dynasty_id"
    t.index ["government_type_id"], name: "index_political_eras_on_government_type_id"
  end

  create_table "stars", force: :cascade do |t|
    t.bigint "constellation_id", null: false
    t.datetime "created_at", null: false
    t.float "magnitude"
    t.integer "mass"
    t.string "name"
    t.integer "temperature"
    t.datetime "updated_at", null: false
    t.index ["constellation_id"], name: "index_stars_on_constellation_id"
  end

  create_table "teste", id: :integer, default: nil, force: :cascade do |t|
    t.string "nome", limit: 255
  end

  add_foreign_key "capitals", "political_eras"
  add_foreign_key "political_eras", "countries"
  add_foreign_key "political_eras", "dynasties"
  add_foreign_key "political_eras", "government_types"
  add_foreign_key "stars", "constellations"
end
