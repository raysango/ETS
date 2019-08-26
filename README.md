# Add option to print ETS form for each patient
Setup dB: bundle exec rake db:setup

Create patient record in console:
Patient model validates presence of first_name, last_name, dob

Create admission for patient from the console:
Admission model validates presence of patient, moment
