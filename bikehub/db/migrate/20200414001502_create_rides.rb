class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.integer :user_id
      t.integer :bike_id
      t.text :description
      t.integer :distance
      t.float :elevation_gain
      t.string :map

      t.timestamps
    end
  end
end
