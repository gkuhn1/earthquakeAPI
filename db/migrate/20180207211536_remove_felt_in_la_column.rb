class RemoveFeltInLaColumn < ActiveRecord::Migration[5.1]
  def change
    remove_index :earthquakes, [:time, :felt_in_la]
    remove_column :earthquakes, :felt_in_la

    add_index :earthquakes, [:time, :mag, :distance_from_la]
  end
end
