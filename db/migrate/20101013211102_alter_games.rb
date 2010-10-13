class AlterGames < ActiveRecord::Migration
  def self.up
    change_column :games, :location, :integer
    change_column :games, :intensity, :integer
    change_column :games, :form, :integer
    remove_column :games, :max_players
    remove_column :games, :min_players
    
    add_column :games, :players, :integer
  end

  def self.down
    change_column :games, :location, :string
    change_column :games, :intensity, :string
    change_column :games, :form, :string
    add_column :games, :max_players, :integer
    add_column :games, :min_players, :integer
    
    remove_column :games, :players
  end
end
