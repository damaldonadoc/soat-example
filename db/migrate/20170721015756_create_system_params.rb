class CreateSystemParams < ActiveRecord::Migration[5.1]
  def change
    create_table :system_params do |t|
      t.string :key, null: false
      t.string :value_type, null: false
      t.string :value, null: false
      t.string :version, null: false
      t.string :state, null: false

      t.timestamps
    end
  end
end
