class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :description
      
      t.timestamps
    end
    
    create_table :games_locations, :id => false do |t|
      t.integer :game_id
      t.integer :location_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
    drop_table :games_locations
  end
end
