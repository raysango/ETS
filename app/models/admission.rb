class Admission < ActiveRecord::Base
  validates_presence_of :patient, :moment
  belongs_to :patient
  has_many :diagnoses, as: :owner
  has_many :symptoms
  has_many :observations
  has_many :medications
  has_many :treatments
  has_many :diagnostic_procedures

  def get_patient_diagnoses_text
    return "Unavailable diagnoses" unless diagnoses.present?
    "#{diagnoses.map{|diagnosis| "#{diagnosis.description} (#{diagnosis.code})"}.to_sentence}"
  end

  def get_symptoms_text
    return "Unavailable" unless symptoms.present?
    "#{symptoms.pluck(:description).to_sentence}"
  end

  def get_observations_text
    return "No observations available" unless observations.present?
    "#{observations.pluck(:description).to_sentence}"
  end

  def get_medications_text
    return "No medications" unless medications.present?
    "#{medications.map{|med| "#{med.name} #{med.dosage.to_i}#{med.unit} #{med.route} q#{med.order_frequency.value}#{med.order_frequency.unit} to #{med.necessity}"}.to_sentence}"
  end

  def get_treatments_text
    return "with no treatments" unless treatments.present?
    "to #{treatments.map{|treatment| "#{treatment.description} to #{treatment.necessity}"}.to_sentence}"
  end

  def get_moment_text
    "#{moment.strftime('%b %d, %Y')} at #{moment.strftime('%H:%M %P')}"
  end



end