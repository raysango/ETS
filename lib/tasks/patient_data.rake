namespace :patient_data do
  task create: :environment do

    patient = Patient.create(first_name: 'John', last_name: 'Emerson', dob: (Date.today - 33.years) )
    admission = patient.admissions.create(moment: Date.today - 4.days)
    admission.diagnoses.create(description: " a fracture of upper end of the right tibia", code: "S82.101")
    admission.symptoms.create(description: "severe pain, swelling and limited bending of the joint")
    admission.observations.create(description: "No soft tissues were damaged", moment: Date.today - 4.days)
    patient.allergies.create(description: 'hypersensitivity to aspirin or NSAIDs')
    patient.allergies.create(description: 'gluten intolerance')
    patient.diagnoses.create(description: 'Asthma', code: 'J45')
    order_frequency_4 = OrderFrequency.create(value: 4, unit: 0)
    order_frequency_6 = OrderFrequency.create(value: 6, unit: 0)
    patient.medications.create(name: 'Acetaminophen', dosage: 500, order_frequency_id: order_frequency_4.id, necessity: 'relieve pain')
    patient.medications.create(name: 'Naproxen', dosage: 500, order_frequency_id: order_frequency_6.id, necessity: 'relieve
swelling')
    diagnostic_procedure = patient.diagnostic_procedures.create(description: 'an exploratory radiography', moment: Date.today - 88.hours)
    diagnostic_procedure.diagnoses.create(description: 'a closed fracture in the right tibia', code: 'S82.101A')



  end
end