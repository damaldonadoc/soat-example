class CreateClassifications < ActiveRecord::Migration[5.1]
  def change
    create_table :classifications do |t|
      t.references :vehicle_class, foreign_key: true
      t.references :sub_type, foreign_key: true, null: true

      t.timestamps
    end
  end
end
