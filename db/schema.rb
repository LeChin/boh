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

ActiveRecord::Schema.define(version: 20160322042334) do

  create_table "fae_changes", force: :cascade do |t|
    t.integer  "changeable_id"
    t.string   "changeable_type"
    t.integer  "user_id"
    t.string   "change_type"
    t.text     "updated_attributes"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "fae_changes", ["changeable_id"], name: "index_fae_changes_on_changeable_id"
  add_index "fae_changes", ["changeable_type"], name: "index_fae_changes_on_changeable_type"
  add_index "fae_changes", ["user_id"], name: "index_fae_changes_on_user_id"

  create_table "fae_files", force: :cascade do |t|
    t.string   "name"
    t.string   "asset"
    t.integer  "fileable_id"
    t.string   "fileable_type"
    t.integer  "file_size"
    t.integer  "position",      default: 0
    t.string   "attached_as"
    t.boolean  "on_stage",      default: true
    t.boolean  "on_prod",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "required",      default: false
  end

  add_index "fae_files", ["attached_as"], name: "index_fae_files_on_attached_as"
  add_index "fae_files", ["fileable_type", "fileable_id"], name: "index_fae_files_on_fileable_type_and_fileable_id"

  create_table "fae_images", force: :cascade do |t|
    t.string   "name"
    t.string   "asset"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "alt"
    t.string   "caption"
    t.integer  "position",       default: 0
    t.string   "attached_as"
    t.boolean  "on_stage",       default: true
    t.boolean  "on_prod",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "file_size"
    t.boolean  "required",       default: false
  end

  add_index "fae_images", ["attached_as"], name: "index_fae_images_on_attached_as"
  add_index "fae_images", ["imageable_type", "imageable_id"], name: "index_fae_images_on_imageable_type_and_imageable_id"

  create_table "fae_options", force: :cascade do |t|
    t.string   "title"
    t.string   "time_zone"
    t.string   "colorway"
    t.string   "stage_url"
    t.string   "live_url"
    t.integer  "singleton_guard"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_options", ["singleton_guard"], name: "index_fae_options_on_singleton_guard", unique: true

  create_table "fae_roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fae_static_pages", force: :cascade do |t|
    t.string   "title"
    t.integer  "position",   default: 0
    t.boolean  "on_stage",   default: true
    t.boolean  "on_prod",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "fae_static_pages", ["slug"], name: "index_fae_static_pages_on_slug"

  create_table "fae_text_areas", force: :cascade do |t|
    t.string   "label"
    t.text     "content"
    t.integer  "position",         default: 0
    t.boolean  "on_stage",         default: true
    t.boolean  "on_prod",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contentable_id"
    t.string   "contentable_type"
    t.string   "attached_as"
  end

  add_index "fae_text_areas", ["attached_as"], name: "index_fae_text_areas_on_attached_as"
  add_index "fae_text_areas", ["contentable_id"], name: "index_fae_text_areas_on_contentable_id"
  add_index "fae_text_areas", ["contentable_type"], name: "index_fae_text_areas_on_contentable_type"
  add_index "fae_text_areas", ["on_prod"], name: "index_fae_text_areas_on_on_prod"
  add_index "fae_text_areas", ["on_stage"], name: "index_fae_text_areas_on_on_stage"
  add_index "fae_text_areas", ["position"], name: "index_fae_text_areas_on_position"

  create_table "fae_text_fields", force: :cascade do |t|
    t.integer  "contentable_id"
    t.string   "contentable_type"
    t.string   "attached_as"
    t.string   "label"
    t.string   "content"
    t.integer  "position",         default: 0
    t.boolean  "on_stage",         default: true
    t.boolean  "on_prod",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fae_text_fields", ["attached_as"], name: "index_fae_text_fields_on_attached_as"
  add_index "fae_text_fields", ["contentable_type", "contentable_id"], name: "index_fae_text_fields_on_contentable_type_and_contentable_id"
  add_index "fae_text_fields", ["on_prod"], name: "index_fae_text_fields_on_on_prod"
  add_index "fae_text_fields", ["on_stage"], name: "index_fae_text_fields_on_on_stage"
  add_index "fae_text_fields", ["position"], name: "index_fae_text_fields_on_position"

  create_table "fae_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "role_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "language"
  end

  add_index "fae_users", ["confirmation_token"], name: "index_fae_users_on_confirmation_token", unique: true
  add_index "fae_users", ["email"], name: "index_fae_users_on_email", unique: true
  add_index "fae_users", ["reset_password_token"], name: "index_fae_users_on_reset_password_token", unique: true
  add_index "fae_users", ["role_id"], name: "index_fae_users_on_role_id"
  add_index "fae_users", ["unlock_token"], name: "index_fae_users_on_unlock_token", unique: true

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "yield"
    t.string   "prep_time"
    t.string   "cook_time"
    t.text     "description"
    t.text     "ingredients"
    t.text     "method"
    t.text     "possible_combination"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
