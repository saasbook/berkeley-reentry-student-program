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

ActiveRecord::Schema.define(version: 2022_03_05_044747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkin_records", force: :cascade do |t|
    t.datetime "time"
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_checkin_records_on_student_id"
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

  add_foreign_key "checkin_records", "users", column: "student_id"
end
