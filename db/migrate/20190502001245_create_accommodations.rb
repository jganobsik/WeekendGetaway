class CreateAccommodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :getaway_id

      t.timestamps
    end
  end
end
