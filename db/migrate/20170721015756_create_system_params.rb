class CreateSystemParams < ActiveRecord::Migration[5.1]
  def change
    create_table :system_params do |t|
      t.string :key
      t.string :value_type
      t.string :value
      t.string :version
      t.string :state

      t.timestamps
    end
  end
end
