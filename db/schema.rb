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

ActiveRecord::Schema.define(version: 20140801190056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: true do |t|
    t.text     "note"
    t.integer  "user_id"
    t.integer  "service_request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["service_request_id"], name: "index_notes_on_service_request_id", using: :btree
  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

  create_table "request_types", force: true do |t|
    t.string   "category"
    t.string   "request"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_requests", force: true do |t|
    t.string   "community_name"
    t.string   "client_name"
    t.string   "client_phone"
    t.string   "client_email"
    t.string   "apt_number"
    t.integer  "status"
    t.text     "work_desc"
    t.text     "special_instructions"
    t.string   "pet"
    t.boolean  "alarm"
    t.string   "community_street_address"
    t.string   "community_zip_code"
    t.datetime "assigned_at"
    t.datetime "closed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end