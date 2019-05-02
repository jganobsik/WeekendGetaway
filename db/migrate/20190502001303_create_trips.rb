class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.boolean :road_trip
      t.boolean :flight
      t.integer :duration

      t.timestamps
    end
  end
end
