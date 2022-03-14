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

ActiveRecord::Schema.define(version: 2022_03_10_222144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.date "issued_date"
    t.bigint "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_announcements_on_admin_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "time"
    t.string "location"
    t.bigint "staff_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id"
    t.index ["staff_id"], name: "index_appointments_on_staff_id"
    t.index ["student_id"], name: "index_appointments_on_student_id"
  end

  create_table "checkins", force: :cascade do |t|
    t.datetime "time"
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_checkins_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "sid"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.boolean "is_student"
    t.boolean "is_admin"
    t.boolean "is_staff"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["sid"], name: "index_users_on_sid", unique: true
  end

  add_foreign_key "announcements", "users", column: "admin_id"
  add_foreign_key "appointments", "users", column: "staff_id"
  add_foreign_key "appointments", "users", column: "student_id"
  add_foreign_key "checkins", "users", column: "student_id"
end
