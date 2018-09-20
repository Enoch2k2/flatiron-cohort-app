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

ActiveRecord::Schema.define(version: 2018_09_19_164431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.integer "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "start_date"
    t.date "end_date"
  end

  create_table "meetings", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.string "time"
    t.string "current_lesson"
    t.integer "completed_lessons"
    t.boolean "struggling"
    t.boolean "behind_schedule"
    t.integer "knowledge_check"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "added_to_doc?"
    t.boolean "added_to_instructor_app?"
    t.index ["user_id"], name: "index_meetings_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_cohorts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "left_at"
    t.date "joined_at"
    t.index ["cohort_id"], name: "index_student_cohorts_on_cohort_id"
    t.index ["user_id"], name: "index_student_cohorts_on_user_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "slack_username"
    t.string "current_lesson"
    t.integer "completed_lessons", default: 0
    t.string "learn_profile"
    t.integer "current_cohort_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "meetings", "users"
  add_foreign_key "student_cohorts", "cohorts"
  add_foreign_key "student_cohorts", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
