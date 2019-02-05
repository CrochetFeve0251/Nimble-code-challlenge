# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190204134220) do

  create_table "courses", force: :cascade do |t|
    t.string  "subject"
    t.integer "instructor_id"
  end

  add_index "courses", ["instructor_id"], name: "index_courses_on_instructor_id"

  create_table "courses_people", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "course_id"
  end

  add_index "courses_people", ["course_id"], name: "index_courses_people_on_course_id"
  add_index "courses_people", ["person_id"], name: "index_courses_people_on_person_id"

  create_table "instructor_compagnions", force: :cascade do |t|
    t.integer "instructor_number"
    t.string  "departement_name"
    t.integer "instructor_id"
  end

  add_index "instructor_compagnions", ["instructor_id"], name: "index_instructor_compagnions_on_instructor_id"

  create_table "people", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "login"
    t.string   "password"
    t.integer  "citizen_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true
  add_index "people", ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true

  create_table "student_compagnions", force: :cascade do |t|
    t.integer "student_number"
    t.integer "student_id"
  end

  add_index "student_compagnions", ["student_id"], name: "index_student_compagnions_on_student_id"

end
