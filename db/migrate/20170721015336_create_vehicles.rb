class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :registration_number, null: false
      t.references :classification, foreign_key: true
      t.integer :release_year, null: false

      t.timestamps
    end
  end
end
