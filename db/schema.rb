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

ActiveRecord::Schema.define(version: 20171129205925) do

  create_table "comment_sub_joins", force: :cascade do |t|
    t.integer  "sub_driver_id"
    t.integer  "comment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["comment_id"], name: "index_comment_sub_joins_on_comment_id"
    t.index ["sub_driver_id"], name: "index_comment_sub_joins_on_sub_driver_id"
  end

  create_table "comment_word_joins", force: :cascade do |t|
    t.integer  "comment_id"
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_word_joins_on_comment_id"
    t.index ["word_id"], name: "index_comment_word_joins_on_word_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment_text"
    t.integer  "driver_id"
    t.integer  "team_id"
    t.boolean  "tagged",       default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["driver_id"], name: "index_comments_on_driver_id"
    t.index ["team_id"], name: "index_comments_on_team_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_drivers", force: :cascade do |t|
    t.string   "name"
    t.integer  "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_sub_drivers_on_driver_id"
  end

  create_table "sub_word_joins", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "sub_driver_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["sub_driver_id"], name: "index_sub_word_joins_on_sub_driver_id"
    t.index ["word_id"], name: "index_sub_word_joins_on_word_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_teams_on_company_id"
  end

  create_table "words", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
