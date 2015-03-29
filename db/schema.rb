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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150329194830) do

  create_table "genres", force: :cascade do |t|
    t.string   "title"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "genres", ["song_id"], name: "index_genres_on_song_id"

  create_table "genres_songs", id: false, force: :cascade do |t|
    t.integer "song_id",  null: false
    t.integer "genre_id", null: false
  end

  add_index "genres_songs", ["genre_id"], name: "index_genres_songs_on_genre_id"
  add_index "genres_songs", ["song_id"], name: "index_genres_songs_on_song_id"

  create_table "marks", force: :cascade do |t|
    t.integer  "value"
    t.integer  "markable_id"
    t.string   "markable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "title"
    t.integer  "likes"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "playlists", ["song_id"], name: "index_playlists_on_song_id"
  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id"

  create_table "playlists_songs", id: false, force: :cascade do |t|
    t.integer "playlist_id", null: false
    t.integer "song_id",     null: false
  end

  add_index "playlists_songs", ["playlist_id"], name: "index_playlists_songs_on_playlist_id"
  add_index "playlists_songs", ["song_id"], name: "index_playlists_songs_on_song_id"

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "performer"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  add_index "songs", ["user_id"], name: "index_songs_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.float    "rate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
  end

end