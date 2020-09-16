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

ActiveRecord::Schema.define(version: 2020_09_15_143649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "icon"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "corrections", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_corrections_on_post_id"
    t.index ["user_id"], name: "index_corrections_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "levels", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "title"
    t.text "entry"
    t.text "translation"
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
    t.bigint "level_id", null: false
    t.bigint "prompt_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["language_id"], name: "index_posts_on_language_id"
    t.index ["level_id"], name: "index_posts_on_level_id"
    t.index ["prompt_id"], name: "index_posts_on_prompt_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.text "prompt"
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
    t.bigint "level_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_prompts_on_language_id"
    t.index ["level_id"], name: "index_prompts_on_level_id"
    t.index ["user_id"], name: "index_prompts_on_user_id"
  end

  create_table "segment_corrections", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "segment_id", null: false
    t.bigint "correction_id", null: false
    t.text "entry"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["correction_id"], name: "index_segment_corrections_on_correction_id"
    t.index ["segment_id"], name: "index_segment_corrections_on_segment_id"
  end

  create_table "segments", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "post_id"
    t.text "segment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_segments_on_post_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "user_badges", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "user_id", null: false
    t.bigint "badge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["badge_id"], name: "index_user_badges_on_badge_id"
    t.index ["user_id"], name: "index_user_badges_on_user_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
    t.bigint "level_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["level_id"], name: "index_user_languages_on_level_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "about"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "corrections", "posts"
  add_foreign_key "corrections", "users"
  add_foreign_key "posts", "categories"
  add_foreign_key "posts", "languages"
  add_foreign_key "posts", "levels"
  add_foreign_key "posts", "prompts"
  add_foreign_key "posts", "users"
  add_foreign_key "prompts", "languages"
  add_foreign_key "prompts", "levels"
  add_foreign_key "prompts", "users"
  add_foreign_key "segment_corrections", "corrections"
  add_foreign_key "segment_corrections", "segments"
  add_foreign_key "segments", "posts"
  add_foreign_key "taggings", "tags"
  add_foreign_key "user_badges", "badges"
  add_foreign_key "user_badges", "users"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "levels"
  add_foreign_key "user_languages", "users"
end
