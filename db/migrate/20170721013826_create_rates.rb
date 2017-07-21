class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :code
      t.references :classification, foreign_key: true
      t.references :age_range, foreign_key: true, null: true
      t.float :value

      t.timestamps
    end
  end
end
