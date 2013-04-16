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

ActiveRecord::Schema.define(:version => 20130416020459) do

  create_table "orders", :force => true do |t|
    t.integer  "tour_id"
    t.integer  "user_id"
    t.date     "date_purchased"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "statuses", :force => true do |t|
    t.integer  "step_id"
    t.integer  "user_id"
    t.boolean  "is_complete"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "steps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address"
    t.float    "lat"
    t.float    "lng"
    t.string   "audiofile"
    t.integer  "tour_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
  end

  create_table "tours", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "lat"
    t.float    "lng"
    t.string   "image"
    t.decimal  "price"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.float    "lat"
    t.float    "lng"
    t.string   "address"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
