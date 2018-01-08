class CreateTunes < ActiveRecord::Migration[5.1]
  def change
    create_table :tunes do |t|
      t.string :title
      t.datetime :selected_at

      t.timestamps
    end
  end
end
