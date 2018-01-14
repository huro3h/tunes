class CreateDjs < ActiveRecord::Migration[5.1]
  def change
    create_table :djs do |t|
      t.string :name

      t.timestamps
    end
  end
end
