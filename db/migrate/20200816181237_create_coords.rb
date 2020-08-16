class CreateCoords < ActiveRecord::Migration[6.0]
  def change
    create_table :coords do |t|
      t.integer :latitude
      t.integer :longitude
      t.integer :altitude
      t.integer :accuracy
      t.integer :heading
      t.integer :speed
      t.integer :location_id

      t.timestamps
    end
  end
end
