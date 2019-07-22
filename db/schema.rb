# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_22_194553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicant_details", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "firstname", null: false
    t.string "middlename"
    t.string "lastname", null: false
    t.string "gender", null: false
    t.boolean "us_citizen", null: false
    t.string "demographic", null: false
    t.date "birthdate", null: false
    t.text "diet_restrictions", null: false
    t.string "shirt_size", null: false
    t.string "address1", null: false
    t.string "address2"
    t.string "city", null: false
    t.string "state", null: false
    t.string "state_non_us"
    t.string "postalcode", null: false
    t.string "country", null: false
    t.string "phone", null: false
    t.string "parentname", null: false
    t.string "parentaddress1", null: false
    t.string "parentaddress2"
    t.string "parentcity", null: false
    t.string "parentstate"
    t.string "parentstate_non_us"
    t.string "parentzip", null: false
    t.string "parentcountry", null: false
    t.string "parentphone", null: false
    t.string "parentworkphone"
    t.string "parentemail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_applicant_details_on_user_id"
  end

  create_table "camp_configurations", force: :cascade do |t|
    t.integer "camp_year", null: false
    t.date "application_open", null: false
    t.date "application_close", null: false
    t.date "priority", null: false
    t.date "application_materials_due", null: false
    t.date "camper_acceptance_due", null: false
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["camp_year"], name: "index_camp_configurations_on_camp_year"
  end
  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applicant_details", "users"
end
