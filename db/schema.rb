# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101104233150) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_games", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "category_id"
  end

  create_table "contents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents_games", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "content_id"
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "extension"
    t.integer  "intensity",   :limit => 255
    t.integer  "form",        :limit => 255
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "other_names"
  end

  create_table "games_locations", :id => false, :force => true do |t|
    t.integer  "game_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games_player_counts", :id => false, :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_count_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_counts", :force => true do |t|
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "salt"
    t.string   "hashed_password"
    t.boolean  "is_admin",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
