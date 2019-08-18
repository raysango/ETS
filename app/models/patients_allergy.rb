class PatientsAllergy < ActiveRecord::Base
  belongs_to :patient
  belongs_to :allergy

end