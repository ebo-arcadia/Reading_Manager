class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :note
      t.references :reader, index: true, foreign_key: true
      t.references :list, index: true, foreign_key: true

      t.timestamps
    end
  end
end
