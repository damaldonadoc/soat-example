class CreateAgeRanges < ActiveRecord::Migration[5.1]
  def change
    create_table :age_ranges do |t|
      t.string :name
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end
