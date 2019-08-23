require 'rails_helper'
feature "Front Page with patients" do
  let!(:patient_x) {create(:patient)}

  scenario "Home page with patient name" do
    visit root_path
    expect(page).to have_content(patient_x.full_name)
    expect(page).to have_content("Generate ETS")
  end
end

feature "Front Page with no patients" do

  scenario "Home page with no patients" do
    visit root_path
    expect(page).to have_content("No patients available")
    expect(page).to_not have_content("Generate ETS")
  end
end

feature "Ets page" do
  let!(:patient_x) {create(:patient)}
  let!(:facility_x) {create(:facility)}
  let!(:admission_x) {create(:admission, patient: patient_x)}

  scenario "Form generated with default values" do
    visit generate_ets_patient_path(patient_x)
    expect(page).to have_content(facility_x.name)
    expect(page).to have_content(patient_x.first_name)
    expect(page).to have_content(patient_x.last_name)
    expect(page).to have_content("Print")
    expect(page).to have_content("This #{patient_x.patient_age} years old #{patient_x.gender} was admitted to #{facility_x.name} emergency facility on #{admission_x.get_moment_text} due to Unavailable diagnoses. The observed symptoms on admission were Unavailable. No observations available.

Upon asking about known allergies, the patient disclosed No allergies. Upon asking about chronic conditions, the patient disclosed No chronic conditions. The patient was administered with No medications.

The staff performed No procedures, revealing No new diagnoses. Our team proceeded with no treatments.")
  end
end

