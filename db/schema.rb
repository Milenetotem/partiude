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

ActiveRecord::Schema.define(:version => 20130213204644) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "itinerary_id"
    t.string   "content",      :limit => 150, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "itineraries", :force => true do |t|
    t.string   "name",           :null => false
    t.string   "transport_type"
    t.string   "origin",         :null => false
    t.string   "destiny",        :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "recurring_id"
    t.string   "state"
  end

  create_table "participants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "itinerary_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "driver",        :default => false
    t.string   "participation", :default => "pending"
  end

  create_table "points", :force => true do |t|
    t.string   "state",        :default => "active"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "itinerary_id"
    t.string   "latitute"
    t.string   "longitude"
    t.string   "address"
  end

  create_table "polls", :force => true do |t|
    t.integer  "requestor_id"
    t.integer  "itinerary_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "location_point", :limit => 100, :default => "", :null => false
  end

  create_table "recurrings", :force => true do |t|
    t.string   "repeat_in"
    t.string   "hour"
    t.integer  "repeat_weekly_interval"
    t.datetime "begin_day"
    t.integer  "itinerary_id"
    t.boolean  "sunday",                 :default => false
    t.boolean  "monday",                 :default => false
    t.boolean  "tuesday",                :default => false
    t.boolean  "wednesday",              :default => false
    t.boolean  "thursday",               :default => false
    t.boolean  "friday",                 :default => false
    t.boolean  "saturday",               :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "username",                              :default => "",     :null => false
    t.string   "email",                                 :default => "",     :null => false
    t.string   "encrypted_password",                    :default => "",     :null => false
    t.boolean  "admin",                                 :default => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.string   "nickname",               :limit => 50
    t.string   "name",                   :limit => 50
    t.string   "last_name",              :limit => 100
    t.string   "address",                :limit => 150
    t.string   "city",                   :limit => 20
    t.string   "territory",              :limit => 20
    t.string   "phone",                  :limit => 15
    t.string   "federal_id",             :limit => 20
    t.string   "subscription_mode",                     :default => "free"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "poll_id"
    t.boolean  "approve"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_foreign_key "points", "itineraries", :name => "fk_points_itinerary_id"

end
