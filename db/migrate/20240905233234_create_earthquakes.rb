class CreateEarthquakes < ActiveRecord::Migration[7.1]
  def change
    create_table :earthquakes do |t|
      t.datetime :date
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :depth
      t.string :location
      t.decimal :magnitude

      t.timestamps
    end
  end
end
