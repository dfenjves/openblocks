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

ActiveRecord::Schema.define(version: 20140404125835) do

  create_table "dashboard_spots", force: true do |t|
    t.integer  "dashboard_id"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spot_tags", force: true do |t|
    t.integer  "spot_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spots", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.string   "icon_url"
    t.integer  "monday_open"
    t.integer  "monday_close"
    t.integer  "tuesday_open"
    t.integer  "tuesday_close"
    t.integer  "wednesday_open"
    t.integer  "wednesday_close"
    t.integer  "thursday_open"
    t.integer  "thursday_close"
    t.integer  "friday_open"
    t.integer  "friday_close"
    t.integer  "saturday_open"
    t.integer  "saturday_close"
    t.integer  "sunday_open"
    t.integer  "sunday_close"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "schedule_data"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
