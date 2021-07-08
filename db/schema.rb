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

ActiveRecord::Schema.define(version: 2021_07_08_200246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "phone"
    t.string "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "course_id"
    t.string "date"
    t.string "tee_time"
    t.integer "open_spots"
    t.string "number_of_holes"
    t.string "player_id"
    t.boolean "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.string "follower"
    t.string "followee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_events", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "event_id"
    t.boolean "invite_accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_player_events_on_event_id"
    t.index ["player_id"], name: "index_player_events_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "player_events", "events"
  add_foreign_key "player_events", "players"
end
