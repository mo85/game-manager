class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :salt
      t.string :hashed_password
      t.boolean :is_admin, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
