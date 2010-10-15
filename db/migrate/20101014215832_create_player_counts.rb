class CreatePlayerCounts < ActiveRecord::Migration
  def self.up
    create_table :player_counts do |t|
      t.integer :count

      t.timestamps
    end
    
    create_table :games_player_counts, :id => false do |t|
      t.integer :game_id
      t.integer :player_count_id
      
      t.timestamps
    end
    
  end

  def self.down
    drop_table :player_counts
    drop_table :games_player_counts
  end
end
