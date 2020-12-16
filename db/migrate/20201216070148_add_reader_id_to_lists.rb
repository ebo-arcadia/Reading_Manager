class AddReaderIdToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :reader, index: true, foreign_key: true
  end
end
