class CreateDiagnosticProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :diagnostic_procedures do |t|
      t.text :description
      t.datetime :moment
      t.references :admission
    end
  end

  def down
    drop_table :diagnostic_procedures
  end
end
