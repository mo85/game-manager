class RemoveContentFromGame < ActiveRecord::Migration
  def self.up
    remove_column :games, :content
    remove_column :games, :players
    remove_column :games, :location
  end

  def self.down
    add_column :games, :content, :string
    add_column :games, :players, :integer
    add_column :games, :location, :integer
  end
end
