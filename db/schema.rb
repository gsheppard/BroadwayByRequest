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

ActiveRecord::Schema.define(version: 20140322151909) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "casts", force: true do |t|
    t.integer  "actor_id",    null: false
    t.integer  "set_list_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "casts", ["actor_id"], name: "index_casts_on_actor_id", using: :btree
  add_index "casts", ["set_list_id"], name: "index_casts_on_set_list_id", using: :btree

  create_table "musicals", force: true do |t|
    t.string   "name",       null: false
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performances", force: true do |t|
    t.datetime "date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "set_lists", force: true do |t|
    t.integer  "performance_id"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "name",       null: false
    t.integer  "musical_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
