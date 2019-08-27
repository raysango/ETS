class Patient < ActiveRecord::Base
  belongs_to :admission
  has_many :admissions # I think a patient can have multiple admissions
  has_many :patients_allergies, :foreign_key => 'patient_id', :dependent => :delete_all # allergies are common between patients so I'm using a join table
  has_many :allergies, through: :patients_allergies
  has_many :diagnoses, as: :owner
  has_many :medications, through: :admission
  has_many :diagnostic_procedures, through: :admission
  has_many :patient_diagnoses, through: :diagnostic_procedures, source: :diagnoses
  has_many :treatments, through: :admission
  enum gender: {male: 0, female: 1, other: 2}
  validates_presence_of :first_name, :last_name, :dob, :gender
  validate :dob_in_the_past

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end

  def patient_age
    Date.today.year - dob.year

  end

  def chronic_conditions
    diagnoses.where("created_at >= ?", admission.moment)
  end

  def get_allergies_text
    return "No allergies" unless allergies.present?
    "#{allergies.pluck(:description).to_sentence}"
  end

  def get_chronic_conditions_text
    return "No chronic conditions" unless chronic_conditions.present?
    "#{chronic_conditions.map{|diagnosis| "#{diagnosis.description} (#{diagnosis.code})"}.to_sentence}"
  end

  def get_diagnostic_procedures_text
    return "No procedures" unless diagnostic_procedures.present?
    "#{diagnostic_procedures.map{|pr| "#{pr.description} on #{datetime_formatted(pr.moment)}"}.to_sentence}"
  end

  def get_patient_diagnoses_text
    return "No new diagnoses" unless patient_diagnoses.present?
    "#{patient_diagnoses.map{|diagnosis| "#{diagnosis.description} (#{diagnosis.code})"}.to_sentence}"
  end

  private

  def dob_in_the_past
    if dob > Date.today
      errors.add(:dob, "can't be in the future")
    end
  end

  def datetime_formatted(time)
    "#{time.strftime('%b %d, %Y')} at #{time.strftime('%H:%M %P')}"
  end
end
