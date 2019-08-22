class CreateTreatments < ActiveRecord::Migration[6.0]
  def change
    create_table :treatments do |t|
      t.text :description
      t.text :necessity
      t.references :admission
    end
  end

  def down
    drop_table :treatments
  end
end
