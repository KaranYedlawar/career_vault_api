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

ActiveRecord::Schema[7.1].define(version: 2025_08_25_161810) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "job_id", null: false
    t.uuid "freelancer_id", null: false
    t.text "cover_letter"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["freelancer_id"], name: "index_applications_on_freelancer_id"
    t.index ["job_id", "freelancer_id"], name: "index_applications_on_job_id_and_freelancer_id", unique: true
    t.index ["job_id"], name: "index_applications_on_job_id"
    t.index ["status"], name: "index_applications_on_status"
    t.check_constraint "status = ANY (ARRAY[0, 1, 2, 3])", name: "applications_status_check"
  end

  create_table "contracts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "job_id", null: false
    t.uuid "client_id", null: false
    t.uuid "freelancer_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_contracts_on_client_id"
    t.index ["freelancer_id"], name: "index_contracts_on_freelancer_id"
    t.index ["job_id"], name: "index_contracts_on_job_id", unique: true
    t.index ["status"], name: "index_contracts_on_status"
    t.check_constraint "status = ANY (ARRAY[0, 1, 2, 3])", name: "contracts_status_check"
  end

  create_table "jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "client_id", null: false
    t.string "title", null: false
    t.text "description"
    t.integer "budget_cents", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_cents"], name: "index_jobs_on_budget_cents"
    t.index ["client_id"], name: "index_jobs_on_client_id"
    t.index ["status"], name: "index_jobs_on_status"
    t.check_constraint "status = ANY (ARRAY[0, 1, 2])", name: "jobs_status_check"
  end

  create_table "jobs_skills", id: false, force: :cascade do |t|
    t.uuid "job_id", null: false
    t.uuid "skill_id", null: false
    t.index ["job_id", "skill_id"], name: "index_jobs_skills_on_job_id_and_skill_id", unique: true
  end

  create_table "milestones", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "contract_id", null: false
    t.string "title", null: false
    t.integer "amount_cents", default: 0, null: false
    t.date "due_date"
    t.integer "status", default: 0, null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id", "position"], name: "index_milestones_on_contract_id_and_position"
    t.index ["contract_id"], name: "index_milestones_on_contract_id"
    t.index ["status"], name: "index_milestones_on_status"
    t.check_constraint "status = ANY (ARRAY[0, 1, 2, 3])", name: "milestones_status_check"
  end

  create_table "payments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "contract_id", null: false
    t.uuid "milestone_id"
    t.integer "amount_cents", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.string "stripe_payment_intent_id"
    t.string "stripe_transfer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_payments_on_contract_id"
    t.index ["milestone_id"], name: "index_payments_on_milestone_id"
    t.index ["status"], name: "index_payments_on_status"
    t.index ["stripe_payment_intent_id"], name: "index_payments_on_stripe_payment_intent_id", unique: true
    t.index ["stripe_transfer_id"], name: "index_payments_on_stripe_transfer_id", unique: true
    t.check_constraint "status = ANY (ARRAY[0, 1, 2])", name: "payments_status_check"
  end

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

  add_foreign_key "applications", "jobs", on_delete: :cascade
  add_foreign_key "applications", "users", column: "freelancer_id", on_delete: :cascade
  add_foreign_key "contracts", "jobs", on_delete: :cascade
  add_foreign_key "contracts", "users", column: "client_id", on_delete: :restrict
  add_foreign_key "contracts", "users", column: "freelancer_id", on_delete: :restrict
  add_foreign_key "jobs", "users", column: "client_id", on_delete: :cascade
  add_foreign_key "jobs_skills", "jobs", on_delete: :cascade
  add_foreign_key "jobs_skills", "skills", on_delete: :cascade
  add_foreign_key "milestones", "contracts", on_delete: :cascade
  add_foreign_key "payments", "contracts", on_delete: :restrict
  add_foreign_key "payments", "milestones", on_delete: :nullify
  add_foreign_key "profiles", "users", on_delete: :cascade
  add_foreign_key "profiles_skills", "profiles", on_delete: :cascade
  add_foreign_key "profiles_skills", "skills", on_delete: :cascade
end
