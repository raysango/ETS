class Allergy < ActiveRecord::Base
  has_many :patients_allergies, :foreign_key => 'allergy_id', :dependent => :delete_all
  has_many :patients, through: :patients_allergies
end