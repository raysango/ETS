class CreatePatient < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :mr
      t.datetime :dob
      t.string :gender
      t.references :admission
    end
  end
end
