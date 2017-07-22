class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :code, null: false
      t.references :classification, foreign_key: true
      t.references :age_range, foreign_key: true
      t.float :value, null: false

      t.timestamps
    end
  end
end
