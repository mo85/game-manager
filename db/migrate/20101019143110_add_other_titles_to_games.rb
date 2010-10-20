class AddOtherTitlesToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :other_names, :text
  end

  def self.down
    remove_column :games, :other_names
  end
end
