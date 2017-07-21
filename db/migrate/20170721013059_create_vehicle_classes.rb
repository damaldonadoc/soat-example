class CreateVehicleClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicle_classes do |t|
      t.string :name
      t.boolean :has_age

      t.timestamps
    end
  end
end
