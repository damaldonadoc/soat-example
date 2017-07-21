class CreateInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :insurances do |t|
      t.references :vehicle, foreign_key: true
      t.date :start_on

      t.timestamps
    end
  end
end
