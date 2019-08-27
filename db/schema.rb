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

ActiveRecord::Schema.define(version: 2019_08_18_062114) do

  create_table "admissions", force: :cascade do |t|
    t.datetime "moment"
    t.integer "patient_id"
    t.index ["patient_id"], name: "index_admissions_on_patient_id"
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "coding_system"
    t.string "code"
    t.text "description"
    t.string "owner_type"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_diagnoses_on_owner_type_and_owner_id"
  end

  create_table "diagnostic_procedures", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.integer "admission_id"
    t.index ["admission_id"], name: "index_diagnostic_procedures_on_admission_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
  end

  create_table "medication_orders", force: :cascade do |t|
    t.string "name"
    t.integer "unit", default: 0
    t.decimal "dosage"
    t.integer "route", default: 0
    t.integer "order_frequency_id"
    t.integer "admission_id"
    t.text "necessity"
    t.index ["admission_id"], name: "index_medication_orders_on_admission_id"
    t.index ["order_frequency_id"], name: "index_medication_orders_on_order_frequency_id"
  end

  create_table "observations", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.integer "admission_id"
    t.index ["admission_id"], name: "index_observations_on_admission_id"
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.string "value"
    t.integer "unit", default: 0
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mr"
    t.datetime "dob"
    t.integer "admission_id"
    t.integer "gender", default: 0
    t.index ["admission_id"], name: "index_patients_on_admission_id"
  end

  create_table "patients_allergies", id: false, force: :cascade do |t|
    t.integer "patient_id"
    t.integer "allergy_id"
    t.index ["allergy_id"], name: "index_patients_allergies_on_allergy_id"
    t.index ["patient_id"], name: "index_patients_allergies_on_patient_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.text "description"
    t.integer "admission_id"
    t.index ["admission_id"], name: "index_symptoms_on_admission_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.text "description"
    t.text "necessity"
    t.integer "admission_id"
    t.index ["admission_id"], name: "index_treatments_on_admission_id"
  end

end
