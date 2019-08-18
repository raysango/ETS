class CreateAdmission < ActiveRecord::Migration[6.0]
  def change
    create_table :admissions do |t|
      t.datetime :moment
      t.references :patient
    end
  end
end
