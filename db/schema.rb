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

ActiveRecord::Schema[8.1].define(version: 2026_11_15_223049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "albums", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "year"
  end

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

  create_table "event_images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "historical_event_id", null: false
    t.datetime "updated_at", null: false
    t.index ["historical_event_id"], name: "index_event_images_on_historical_event_id"
  end

  create_table "flags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.bigint "political_era_id", null: false
    t.date "start_date"
    t.datetime "updated_at", null: false
    t.index ["political_era_id"], name: "index_flags_on_political_era_id"
  end

  create_table "government_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "historical_events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.date "end_date"
    t.boolean "enddate_approximate"
    t.decimal "latitude"
    t.string "location"
    t.decimal "longitude"
    t.string "name"
    t.date "start_date"
    t.boolean "startdate_approximate"
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.date "birth"
    t.boolean "birth_approximate"
    t.datetime "created_at", null: false
    t.date "death"
    t.boolean "deathdate_approximate"
    t.bigint "dynasty_id"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["dynasty_id"], name: "index_people_on_dynasty_id"
  end

  create_table "political_eras", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.bigint "dynasty_id"
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

  create_table "portraits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "ruler_id", null: false
    t.datetime "updated_at", null: false
    t.index ["ruler_id"], name: "index_portraits_on_ruler_id"
  end

  create_table "rulers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end"
    t.boolean "enddate_approximate"
    t.bigint "person_id", null: false
    t.bigint "political_era_id", null: false
    t.date "start"
    t.boolean "startdate_approximate"
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_rulers_on_person_id"
    t.index ["political_era_id"], name: "index_rulers_on_political_era_id"
  end

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
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

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.string "role", default: "user"
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "capitals", "political_eras"
  add_foreign_key "event_images", "historical_events"
  add_foreign_key "flags", "political_eras"
  add_foreign_key "people", "dynasties"
  add_foreign_key "political_eras", "countries"
  add_foreign_key "political_eras", "dynasties"
  add_foreign_key "political_eras", "government_types"
  add_foreign_key "portraits", "rulers"
  add_foreign_key "rulers", "people"
  add_foreign_key "rulers", "political_eras"
  add_foreign_key "stars", "constellations"
end
