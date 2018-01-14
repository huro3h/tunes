class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :detail
      t.datetime :event_date_at

      t.timestamps
    end
  end
end
