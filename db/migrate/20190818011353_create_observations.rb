class CreateObservations < ActiveRecord::Migration[6.0]
  def change
    create_table :observations do |t|
      t.text :description
      t.datetime :moment
      t.references :admission
    end
  end
end
