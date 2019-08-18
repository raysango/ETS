class CreatePatientsAllergies < ActiveRecord::Migration[6.0]
  def change
    create_table :patients_allergies, id: false do |t|
      t.integer :patient_id, :allergy_id
    end
    add_index :patients_allergies, :patient_id
    add_index :patients_allergies, :allergy_id
  end
end
