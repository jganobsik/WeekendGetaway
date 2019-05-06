class CreateExcursions < ActiveRecord::Migration[5.2]
  def change
    create_table :excursions do |t|
      t.string :title
      t.text :notes
      t.string :location
      t.integer :getaway_id

      t.timestamps
    end
  end
end
