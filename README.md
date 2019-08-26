# Add option to print ETS form for each patient
Setup db: bundle exec rake db:setup

Create patient record in console:
Patient model validates presence of first_name, last_name, dob

Create admission for patient from the console:
Admission model validates presence of patient, moment

root page routes to pients index page, each patient will have a link to generate the ETS form with the all the patient info and a summary of the patient's medical status

more patient associations rendered in the ETS form summary:
patient.allergies
patient.diagnoses
patient.diagnostic_procedures
patient.patient_diagnoses
patient.medications
patient.treatments
admission.observations
