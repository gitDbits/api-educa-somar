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

ActiveRecord::Schema.define(version: 2021_09_10_162323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.boolean "capital"
    t.bigint "state_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "cnpj"
    t.string "name"
    t.string "email"
    t.string "fantasy_name"
    t.string "phone"
    t.string "street"
    t.string "number"
    t.string "neighborhood"
    t.string "zip_code"
    t.boolean "university"
    t.boolean "school"
    t.string "uf"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["slug"], name: "index_institutions_on_slug", unique: true
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "acronym"
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["region_id"], name: "index_states_on_region_id"
    t.index ["slug"], name: "index_states_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "birthday"
    t.string "phone", limit: 20
    t.string "street"
    t.string "number", limit: 20
    t.string "neighborhood"
    t.string "zip_code", limit: 20
    t.string "slug"
    t.bigint "state_id"
    t.bigint "city_id"
    t.string "cpf", limit: 20
    t.boolean "active", default: true
    t.boolean "approved", default: false
    t.boolean "admin", default: false
    t.boolean "student", default: false
    t.boolean "teacher", default: false
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["state_id"], name: "index_users_on_state_id"
  end

  add_foreign_key "cities", "states"
  add_foreign_key "states", "regions"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "states"
end
