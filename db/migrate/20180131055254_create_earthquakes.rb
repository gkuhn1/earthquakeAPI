class CreateEarthquakes < ActiveRecord::Migration[5.1]
  def change
    create_table :earthquakes do |t|
      t.string :event_id, null: false
      t.datetime :time, null: false
      t.string :latitude, null: false
      t.string :longitude, null: false
      t.string :event_type, null: false
      t.decimal :distance_from_la, null: false
      t.decimal :mag, null: false
      t.boolean :felt_in_la, null: false
      t.string :place, null: false

      t.timestamps
    end

    add_index :earthquakes, :event_id, unique: true
    add_index :earthquakes, [:time, :felt_in_la]
  end
end
