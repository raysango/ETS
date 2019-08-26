# Add option to print ETS form for each patient
Setup steps:<br>

ruby version is 2.6.3<br>
rails version is 6.0.0<br>

install all gems: bundle install<br>

Setup db: bundle exec rake db:setup

To load test patient data run: bundle exec rake patient_data:create

Root page routes to patients index page, show a list of all patients, each patient will have a link to generate the ETS form which includes all the patient info and a summary of the patient's medical status

