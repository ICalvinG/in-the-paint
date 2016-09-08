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

ActiveRecord::Schema.define(version: 20160728195046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title",         null: false
    t.string   "body",          null: false
    t.integer  "team_id"
    t.integer  "user_id"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["team_id"], name: "index_articles_on_team_id", using: :btree
    t.index ["user_id"], name: "index_articles_on_user_id", using: :btree
    t.index ["voteable_type", "voteable_id"], name: "index_articles_on_voteable_type_and_voteable_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body",          null: false
    t.integer  "user_id"
    t.integer  "article_id"
    t.string   "voteable_type"
    t.integer  "voteable_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
    t.index ["voteable_type", "voteable_id"], name: "index_comments_on_voteable_type_and_voteable_id", using: :btree
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "number"
    t.string   "api_id"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "market"
    t.string   "abbr"
    t.string   "api_id"
    t.string   "division"
    t.string   "conference"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 64, null: false
    t.string   "email",           limit: 64, null: false
    t.string   "password_digest",            null: false
    t.integer  "team_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id", using: :btree
  end

end
