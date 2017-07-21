class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.float :value
      t.datetime :capture_at
      t.references :user, foreign_key: true
      t.references :insurance

      t.timestamps
    end
  end
end
