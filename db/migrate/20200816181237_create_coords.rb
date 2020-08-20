class CreateCoords < ActiveRecord::Migration[6.0]
  def change
    create_table :coords do |t|
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :altitude, precision: 10, scale: 6
      t.decimal :accuracy, precision: 10, scale: 6
      t.decimal :heading, precision: 10, scale: 6
      t.decimal :speed, precision: 10, scale: 6
      t.decimal :altitudeAccuracy, precision: 10, scale: 6
      t.integer :location_id

      t.timestamps
    end
  end
end
