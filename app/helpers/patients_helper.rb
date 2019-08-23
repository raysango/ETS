module PatientsHelper

  def patient_ets_summary(patient, facility)
    admission = patient.admission
    return "Summary not available" unless admission.present?
    "This #{patient.patient_age} years old #{patient.gender} was admitted to #{facility.name} emergency facility on #{admission.get_moment_text} due to
    #{admission.get_patient_diagnoses_text}. The observed symptoms on admission were #{admission.get_symptoms_text}. #{admission.get_observations_text}.<br/><br/>
    Upon asking about known allergies, the patient disclosed #{patient.get_allergies_text}. Upon asking about chronic conditions,
    the patient disclosed #{patient.get_chronic_conditions_text}. The patient was administered with #{admission.get_medications_text}.<br/><br/>
    The staff performed #{patient.get_diagnostic_procedures_text}, revealing #{patient.get_patient_diagnoses_text}. Our
    team proceeded #{admission.get_treatments_text}.".html_safe
  end

  def datetime_formatted(time)
    "#{time.strftime('%b %d, %Y')} at #{time.strftime('%H:%M %P')}"
  end
end