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

ActiveRecord::Schema.define(version: 2019_08_17_235508) do

  create_table "admissions", force: :cascade do |t|
    t.datetime "moment"
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_admissions_on_patient_id"
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mr"
    t.datetime "dob"
    t.string "gender"
    t.integer "admission_id"
    t.index ["admission_id"], name: "index_patients_on_admission_id"
  end

  create_table "patients_allergies", id: false, force: :cascade do |t|
    t.integer "patient_id"
    t.integer "allergy_id"
    t.index ["allergy_id"], name: "index_patients_allergies_on_allergy_id"
    t.index ["patient_id"], name: "index_patients_allergies_on_patient_id"
  end

end
