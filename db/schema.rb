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

ActiveRecord::Schema.define(:version => 20111119213719) do

  create_table "bingo_sessions", :force => true do |t|
    t.decimal  "cost_per_card",        :default => 0.1
    t.decimal  "line_prize_per_card",  :default => 0.03
    t.decimal  "bingo_prize_per_card", :default => 0.07
    t.string   "session_name"
    t.boolean  "is_public",            :default => false
    t.integer  "caller_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  create_table "called_numbers", :force => true do |t|
    t.integer  "game_id"
    t.integer  "called_ball"
    t.datetime "called_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "callers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "callers", ["email"], :name => "index_callers_on_email", :unique => true
  add_index "callers", ["reset_password_token"], :name => "index_callers_on_reset_password_token", :unique => true

  create_table "games", :force => true do |t|
    t.integer  "max_balls",                 :default => 90
    t.integer  "bingo_session_id"
    t.integer  "player_with_first_line_id"
    t.integer  "player_with_bingo_id"
    t.integer  "secs_between_calls",        :default => 6
    t.integer  "game_number",               :default => 1
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "player_games", :force => true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "cards_played", :default => 3
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "player_games", ["player_id", "game_id"], :name => "index_player_games_on_player_id_and_game_id", :unique => true

  create_table "players", :force => true do |t|
    t.integer  "bingo_session_id"
    t.string   "name"
    t.integer  "caller_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

end
