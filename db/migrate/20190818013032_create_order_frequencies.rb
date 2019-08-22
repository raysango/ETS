class CreateOrderFrequencies < ActiveRecord::Migration[6.0]
  def change
    create_table :order_frequencies do |t|
      t.string :value
      t.integer :unit, default: 0
    end
  end

  def down
    drop_table :order_frequencies
  end
end
