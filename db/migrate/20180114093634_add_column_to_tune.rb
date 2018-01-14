class AddColumnToTune < ActiveRecord::Migration[5.1]
  def change
    add_column :tunes, :dj_id, :integer
    add_column :tunes, :event_id, :integer
  end
end
