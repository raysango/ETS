class CreateDiagnoses < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnoses do |t|
      t.string :coding_system
      t.string :code
      t.text :description
      t.references :owner, polymorphic: true
      t.timestamps
    end
  end

  def down
    drop_table :diagnoses
  end
end
