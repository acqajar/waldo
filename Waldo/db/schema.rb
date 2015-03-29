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

ActiveRecord::Schema.define(version: 20150328235645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "img_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id", using: :btree

  create_table "matches", force: :cascade do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.integer  "ucm_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["user_id"], name: "index_matches_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "url_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "user_categories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_categories", ["category_id"], name: "index_user_categories_on_category_id", using: :btree
  add_index "user_categories", ["user_id"], name: "index_user_categories_on_user_id", using: :btree

  create_table "user_category_matches", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "user_category_id"
    t.integer  "uc_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "user_category_matches", ["match_id"], name: "index_user_category_matches_on_match_id", using: :btree
  add_index "user_category_matches", ["user_category_id"], name: "index_user_category_matches_on_user_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "rel_type"
    t.string   "address"
    t.integer  "radius"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "categories"
  add_foreign_key "matches", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_categories", "users"
  add_foreign_key "user_category_matches", "matches"
  add_foreign_key "user_category_matches", "user_categories"
end
