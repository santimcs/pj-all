# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_31_042057) do

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.integer "subscriber"
    t.string "url"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.integer "topic_id", null: false
    t.integer "channel_id", null: false
    t.string "title"
    t.string "url"
    t.integer "total_episode", default: 999
    t.integer "finish_episode", default: 0
    t.boolean "completed", default: false
    t.integer "duration", default: 0
    t.string "image_url"
    t.integer "views", default: 0
    t.date "last_updated"
    t.integer "sequence", default: 9999
    t.integer "rating", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_playlists_on_channel_id"
    t.index ["topic_id"], name: "index_playlists_on_topic_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "playlists", "channels"
  add_foreign_key "playlists", "topics"
end
