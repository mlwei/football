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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180711065205) do

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "event_id"
    t.integer "minute"
    t.integer "second"
    t.integer "country_id"
    t.float   "x_cordinate",        limit: 24
    t.float   "y_cordinate",        limit: 24
    t.integer "period"
    t.string  "event_type"
    t.string  "out_come_type"
    t.text    "qualifier",          limit: 65535
    t.string  "satisfied_event"
    t.boolean "is_touch"
    t.integer "player_id"
    t.float   "end_x_cordinate",    limit: 24
    t.float   "end_y_cordinate",    limit: 24
    t.float   "goal_mouth_z",       limit: 24
    t.float   "goal_mouth_y",       limit: 24
    t.boolean "is_goal"
    t.boolean "is_shoot"
    t.integer "related_event_id"
    t.integer "reloated_player_id"
    t.float   "block_x_cordinate",  limit: 24
    t.float   "block_y_cordinate",  limit: 24
    t.string  "card_type"
  end

  create_table "matches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "weather_code"
    t.string  "stadium"
    t.string  "ht_score"
    t.string  "ft_score"
    t.string  "result"
  end

  create_table "players", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number"
    t.integer "country_id"
    t.string  "name"
    t.string  "position"
    t.string  "height"
    t.string  "weight"
    t.string  "age"
    t.index ["country_id"], name: "index_players_on_country_id", using: :btree
    t.index ["number"], name: "index_players_on_number", using: :btree
  end

end
