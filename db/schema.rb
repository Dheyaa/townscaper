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

ActiveRecord::Schema.define(version: 20161009020913) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_panels", force: :cascade do |t|
    t.string   "project_name"
    t.integer  "admin_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "colour_scene1s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "colour_scene2s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "colour_scene3s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "colour_scenes", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "factorial_scene1s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "factorial_scene2s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "factorial_scene3s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "factorial_scene4s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "factorial_scene5s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "factorial_scenes", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "feed_backs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_panel_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "nowscenes", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "position_scene1s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "position_scene2s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "position_scene3s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "position_scenes", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "scene1s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "scene2s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "scene3s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "scenes", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "space_scene1s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "space_scene2s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "space_scene3s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "space_scenes", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "user_panels", force: :cascade do |t|
    t.boolean  "consent"
    t.boolean  "feedback"
    t.integer  "user_id"
    t.integer  "admin_panel_id"
    t.boolean  "scenes_completed",   default: false
    t.boolean  "tutorial_completed", default: false
    t.boolean  "scene_valid",        default: false
    t.string   "age_group"
    t.boolean  "art_related"
    t.string   "gender"
    t.string   "education_level"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vertices_scene1s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "vertices_scene2s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "vertices_scene3s", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "vertices_scenes", force: :cascade do |t|
    t.string   "file_name"
    t.decimal  "vertices_number"
    t.decimal  "space_ratio"
    t.decimal  "position_difference"
    t.decimal  "colour_difference"
    t.decimal  "scene_score"
    t.integer  "admin_panel_id"
    t.integer  "user_panel_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
