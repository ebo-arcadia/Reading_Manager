class AddGenreIdToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :genre, foreign_key: true
  end
end
