class CreateMedicationOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :medication_orders do |t|
      t.string :name
      t.integer :unit, default: 0
      t.decimal :dosage
      t.integer :route, default: 0
      t.references :order_frequency
      t.references :admission
      t.text :necessity
    end
  end

  def down
    drop_table :medication_orders
  end
end
