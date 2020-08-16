class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :track_id
      t.integer :timestamp

      t.timestamps
    end
  end
end
