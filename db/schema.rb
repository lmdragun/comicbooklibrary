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

ActiveRecord::Schema.define(version: 20150513204557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comics", force: :cascade do |t|
    t.string  "series"
    t.integer "number"
    t.integer "year"
    t.string  "creators"
    t.integer "company_id"
    t.string  "title"
    t.string  "date_published"
    t.string  "cover_img_url"
  end

  create_table "companies", force: :cascade do |t|
    t.string  "name"
    t.integer "year_founded"
    t.string  "logo_url"
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lendees", force: :cascade do |t|
    t.integer "user_id"
    t.integer "loan_id"
  end

  create_table "lenders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "loan_id"
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "lender_id"
    t.integer  "lendee_id"
    t.integer  "ownership_id"
    t.boolean  "out"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comic_id"
    t.string   "location"
    t.text     "note"
    t.boolean  "favorite"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "username"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
