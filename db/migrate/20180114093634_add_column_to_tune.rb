class AddColumnToTune < ActiveRecord::Migration[5.1]
  def change
    add_column :tunes, :dj_id, :integer
  end
end
