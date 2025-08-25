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

ActiveRecord::Schema[7.1].define(version: 2025_08_25_155233) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "profiles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.decimal "hourly_rate", precision: 10, scale: 2
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "profiles_skills", id: false, force: :cascade do |t|
    t.uuid "profile_id", null: false
    t.uuid "skill_id", null: false
    t.index ["profile_id", "skill_id"], name: "index_profiles_skills_on_profile_id_and_skill_id", unique: true
  end

  create_table "skills", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.citext "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_skills_on_name", unique: true
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "role", default: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role"], name: "index_users_on_role"
    t.check_constraint "role = ANY (ARRAY[0, 1, 2])", name: "users_role_check"
  end

  add_foreign_key "profiles", "users", on_delete: :cascade
  add_foreign_key "profiles_skills", "profiles", on_delete: :cascade
  add_foreign_key "profiles_skills", "skills", on_delete: :cascade
end
