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

ActiveRecord::Schema.define(version: 20170606082823) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "fill_id"
    t.bigint "prompt_id"
    t.bigint "user_id"
    t.boolean "anon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fill_id"], name: "index_comments_on_fill_id"
    t.index ["prompt_id"], name: "index_comments_on_prompt_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fills", force: :cascade do |t|
    t.bigint "prompt_id"
    t.bigint "user_id"
    t.string "title"
    t.text "body"
    t.text "tagged_as"
    t.boolean "anon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_fills_on_prompt_id"
    t.index ["user_id"], name: "index_fills_on_user_id"
  end

  create_table "fills_tags", id: false, force: :cascade do |t|
    t.bigint "fill_id", null: false
    t.bigint "tag_id", null: false
  end

  create_table "prompts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id"
    t.text "tagged_as"
    t.boolean "anon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prompts_on_user_id"
  end

  create_table "prompts_tags", id: false, force: :cascade do |t|
    t.bigint "prompt_id", null: false
    t.bigint "tag_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.text "image", default: "/images/cage.jpeg"
    t.string "password_digest"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "fills"
  add_foreign_key "comments", "prompts"
  add_foreign_key "comments", "users"
  add_foreign_key "fills", "prompts"
  add_foreign_key "fills", "users"
  add_foreign_key "prompts", "users"
end
