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

ActiveRecord::Schema.define(version: 20160512004556) do

  create_table "messages", force: :cascade do |t|
    t.string   "to_user"
    t.string   "from_user"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "matches"
    t.string   "go_to_bed",       default: ""
    t.string   "wake_up",         default: ""
    t.boolean  "smoke",           default: false
    t.boolean  "drink",           default: false
    t.boolean  "party",           default: false
    t.boolean  "loud_music",      default: false
    t.string   "messy_or_clean",  default: ""
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
