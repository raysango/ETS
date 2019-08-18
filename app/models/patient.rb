class Patient < ActiveRecord::Base
  has_many :admissions
  has_many :patients_allergies, :foreign_key => 'patient_id', :dependent => :delete_all
  has_many :allergies, through: :patients_allergies
  GENDER = {male: 'Male', female: 'Female', other: 'other'}
  validates_presence_of :first_name, :last_name, :dob
  validates :gender, :inclusion => { :in => GENDER.values}

  #get latest patient admission
  def admission
    admissions.order("moment DESC").limit(1)
  end

end