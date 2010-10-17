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

ActiveRecord::Schema.define(:version => 20101015210558) do

  create_table "bingo_sessions", :force => true do |t|
    t.decimal  "cost_per_card",       :default => 0.1
    t.decimal  "line_prize_percent",  :default => 0.3
    t.decimal  "house_prize_percent", :default => 0.7
    t.string   "session_name"
    t.boolean  "is_public",           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "called_numbers", :force => true do |t|
    t.integer  "game_id"
    t.integer  "called_ball"
    t.datetime "called_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "callers", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "callers", ["email"], :name => "index_callers_on_email", :unique => true
  add_index "callers", ["reset_password_token"], :name => "index_callers_on_reset_password_token", :unique => true

  create_table "games", :force => true do |t|
    t.integer  "max_balls",              :default => 90
    t.integer  "caller_id"
    t.integer  "bingo_session_id"
    t.integer  "player_with_first_line"
    t.integer  "player_with_house"
    t.integer  "secs_between_calls",     :default => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "bingo_session_id"
    t.string   "name"
    t.integer  "caller_id"
    t.integer  "cards_played"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
