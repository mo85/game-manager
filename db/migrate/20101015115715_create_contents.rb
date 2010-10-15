class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :contents_games, :id => false do |t|
      t.integer :game_id
      t.integer :content_id
    end
  end

  def self.down
    drop_table :contents
    drop_table :contents_games
  end
end
