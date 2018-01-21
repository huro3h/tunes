class AddIndexToEvents < ActiveRecord::Migration[5.1]
  def change
    add_index :events, :url, unique: true
  end
end
