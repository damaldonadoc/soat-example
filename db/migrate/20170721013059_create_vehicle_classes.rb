class CreateVehicleClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_classes do |t|
      t.string :name, null: false
      t.boolean :has_age, null: false

      t.timestamps
    end
  end
end
