class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :track_id
      t.integer :latitude
      t.integer :longitude
      t.integer :altitude
      t.integer :accuracy
      t.integer :heading
      t.integer :speed
      t.datetime :timestamp

      t.timestamps
    end
  end
end
