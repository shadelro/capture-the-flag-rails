# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130129224355) do

  create_table "flags", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.float    "latitude_default"
    t.float    "longitude_default"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "flags", ["game_id"], :name => "index_flags_on_game_id", :unique => true

  create_table "games", :force => true do |t|
    t.string   "name"
    t.float    "latitude_goal"
    t.float    "longitude_goal"
    t.boolean  "in_progress"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "games", ["name"], :name => "index_games_on_name", :unique => true

  create_table "registrations", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "registrations", ["game_id", "user_id"], :name => "index_registrations_on_game_id_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

end
