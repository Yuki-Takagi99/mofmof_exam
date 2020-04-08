class CreateNearestStations < ActiveRecord::Migration[5.2]
  def change
    create_table :nearest_stations do |t|
      t.text :line_name
      t.text :station_name
      t.integer :distance_on_foot
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
