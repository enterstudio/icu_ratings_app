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

ActiveRecord::Schema.define(:version => 20110702132055) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "time",       :limit => 2
    t.text     "report"
    t.boolean  "success"
    t.datetime "created_at"
  end

  create_table "fide_players", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "fed",        :limit => 3
    t.string   "title",      :limit => 3
    t.string   "gender",     :limit => 1
    t.integer  "born",       :limit => 2
    t.integer  "rating",     :limit => 2
    t.integer  "icu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fide_players", ["icu_id"], :name => "index_fide_players_on_icu_id"
  add_index "fide_players", ["last_name", "first_name"], :name => "index_fide_players_on_last_name_and_first_name"

  create_table "fide_ratings", :force => true do |t|
    t.integer  "fide_player_id"
    t.integer  "rating",         :limit => 2
    t.integer  "games",          :limit => 2
    t.date     "period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fide_ratings", ["fide_player_id"], :name => "index_fide_ratings_on_fide_player_id"

  create_table "icu_players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "club"
    t.string   "address"
    t.string   "phone_numbers"
    t.string   "fed",           :limit => 3
    t.string   "title",         :limit => 3
    t.string   "gender",        :limit => 1
    t.text     "note"
    t.date     "dob"
    t.date     "joined"
    t.boolean  "deceased"
    t.integer  "master_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "icu_players", ["last_name", "first_name"], :name => "index_icu_players_on_last_name_and_first_name"

  create_table "logins", :force => true do |t|
    t.integer  "user_id"
    t.string   "ip",         :limit => 39
    t.string   "problem",    :limit => 8,  :default => "none"
    t.string   "role",       :limit => 20
    t.datetime "created_at"
  end

  create_table "news_items", :force => true do |t|
    t.string   "headline"
    t.text     "story"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "news_items", ["user_id"], :name => "index_news_items_on_user_id"

  create_table "old_rating_histories", :force => true do |t|
    t.integer "old_tournament_id"
    t.integer "icu_player_id"
    t.integer "old_rating",         :limit => 2
    t.integer "new_rating",         :limit => 2
    t.integer "performance_rating", :limit => 2
    t.integer "tournament_rating",  :limit => 2
    t.integer "bonus",              :limit => 2
    t.integer "games",              :limit => 1
    t.integer "kfactor",            :limit => 1
    t.decimal "actual_score",                    :precision => 3, :scale => 1
    t.decimal "expected_score",                  :precision => 8, :scale => 6
  end

  add_index "old_rating_histories", ["icu_player_id"], :name => "index_old_rating_histories_on_icu_player_id"
  add_index "old_rating_histories", ["old_tournament_id", "icu_player_id"], :name => "by_icu_player_old_tournament", :unique => true
  add_index "old_rating_histories", ["old_tournament_id"], :name => "index_old_rating_histories_on_old_tournament_id"

  create_table "old_tournaments", :force => true do |t|
    t.string  "name"
    t.date    "date"
    t.integer "player_count", :limit => 2
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "fed",                  :limit => 3
    t.string   "title",                :limit => 3
    t.string   "gender",               :limit => 1
    t.integer  "icu_id"
    t.integer  "fide_id"
    t.integer  "icu_rating",           :limit => 2
    t.integer  "fide_rating",          :limit => 2
    t.date     "dob"
    t.string   "status"
    t.string   "category"
    t.integer  "rank",                 :limit => 2
    t.integer  "num"
    t.integer  "tournament_id"
    t.string   "original_name"
    t.string   "original_fed",         :limit => 3
    t.string   "original_title",       :limit => 3
    t.string   "original_gender",      :limit => 1
    t.integer  "original_icu_id"
    t.integer  "original_fide_id"
    t.integer  "original_icu_rating",  :limit => 2
    t.integer  "original_fide_rating", :limit => 2
    t.date     "original_dob"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["fide_id"], :name => "index_players_on_fide_id"
  add_index "players", ["icu_id"], :name => "index_players_on_icu_id"
  add_index "players", ["tournament_id"], :name => "index_players_on_tournament_id"

  create_table "results", :force => true do |t|
    t.integer  "round",       :limit => 1
    t.integer  "player_id"
    t.integer  "opponent_id"
    t.string   "result",      :limit => 1
    t.string   "colour",      :limit => 1
    t.boolean  "rateable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["opponent_id"], :name => "index_results_on_opponent_id"
  add_index "results", ["player_id"], :name => "index_results_on_player_id"

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "site"
    t.string   "arbiter"
    t.string   "deputy"
    t.string   "tie_breaks"
    t.string   "time_control"
    t.date     "start"
    t.date     "finish"
    t.string   "fed",                 :limit => 3
    t.integer  "rounds",              :limit => 1
    t.integer  "user_id"
    t.string   "original_name"
    t.string   "original_tie_breaks"
    t.date     "original_start"
    t.date     "original_finish"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tournaments", ["user_id"], :name => "index_tournaments_on_user_id"

  create_table "uploads", :force => true do |t|
    t.string   "name"
    t.string   "format"
    t.string   "content_type"
    t.string   "file_type"
    t.integer  "size"
    t.integer  "tournament_id"
    t.integer  "user_id"
    t.text     "error"
    t.datetime "created_at"
  end

  add_index "uploads", ["tournament_id"], :name => "index_uploads_on_tournament_id"
  add_index "uploads", ["user_id"], :name => "index_uploads_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",           :limit => 50
    t.string   "preferred_email", :limit => 50
    t.string   "password",        :limit => 20
    t.string   "role",            :limit => 20, :default => "member"
    t.integer  "icu_id"
    t.date     "expiry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end