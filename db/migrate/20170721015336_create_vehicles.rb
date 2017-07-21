class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :registration_number
      t.references :classification, foreign_key: true
      t.integer :release_year

      t.timestamps
    end
  end
end
