class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :document_type, foreign_key: true
      t.string :document_number
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
