class CreateAllergy < ActiveRecord::Migration[6.0]
  def change
    create_table :allergies do |t|
      t.text :description
    end
  end
end
