class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name
      t.text :description
      
      t.text :extension
      t.string :location
      
      t.string :intensity
      t.string :form
      
      t.string :content
      t.text :note
      
      t.integer :min_players
      t.integer :max_players
      
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
