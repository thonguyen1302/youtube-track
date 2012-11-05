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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121105065043) do

  create_table "videos", :force => true do |t|
    t.integer  "this_week_rank"
    t.integer  "last_week_rank"
    t.string   "video_name"
    t.integer  "weeks_on_chart"
    t.integer  "total_aggregate_view"
    t.integer  "this_week_view"
    t.integer  "plus_minus_view"
    t.integer  "time_since_upload"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

end
