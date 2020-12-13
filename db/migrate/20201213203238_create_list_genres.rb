class CreateListGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :list_genres do |t|
      t.belongs_to :list, index: true, foreign_key: true
      t.belongs_to :genre, index: true, foreign_key: true

      t.timestamps
    end
  end
end
