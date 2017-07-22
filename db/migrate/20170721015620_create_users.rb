class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :document_type, foreign_key: true
      t.string :document_number, null: false
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :email, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
