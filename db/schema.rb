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

ActiveRecord::Schema.define(version: 20151121190107) do

  create_table "commands", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "data",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "commands", ["name"], name: "index_commands_on_name", unique: true

  create_table "games", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "games", ["name"], name: "index_games_on_name", unique: true
  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "instructions", force: :cascade do |t|
    t.integer  "game_id",                null: false
    t.integer  "command_id",             null: false
    t.string   "name"
    t.text     "parameters"
    t.integer  "precedence", default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "instructions", ["command_id"], name: "index_instructions_on_command_id"
  add_index "instructions", ["game_id"], name: "index_instructions_on_game_id"

  create_table "serial_numbers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "serial_numbers", ["name"], name: "index_serial_numbers_on_name", unique: true

  create_table "statistics", force: :cascade do |t|
    t.string   "user_id",    null: false
    t.text     "json",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
