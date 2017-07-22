class CreateDocumentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :document_types do |t|
      t.string :name, null: false
      t.string :format, null: false

      t.timestamps
    end
  end
end
