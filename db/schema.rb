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

ActiveRecord::Schema.define(:version => 20120323175618) do

  create_table "activities", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "type"
    t.integer  "user_id"
    t.integer  "family_id"
    t.integer  "activity_id"
    t.integer  "dog_id"
    t.integer  "photo_id"
    t.integer  "pathtrack_id"
    t.text     "description"
    t.text     "comment"
  end

  create_table "dog_pathtrack_maps", :force => true do |t|
    t.integer "dog_id"
    t.integer "pathtrack_id"
  end

  create_table "dogs", :force => true do |t|
    t.integer  "photo_id",                    :null => false
    t.string   "name",                        :null => false
    t.string   "breed",       :default => "", :null => false
    t.string   "sex",         :default => "", :null => false
    t.string   "weight",      :default => "", :null => false
    t.date     "birthday"
    t.date     "joinday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
    t.string   "description", :default => "", :null => false
  end

  create_table "families", :force => true do |t|
    t.string   "photo_id",    :null => false
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer "self_id"
    t.integer "friend_id"
  end

  create_table "images", :force => true do |t|
    t.string   "hash_key"
    t.string   "mime_type"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
    t.integer  "size"
    t.string   "type",        :default => "Photo"
  end

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.integer  "activity_id"
    t.integer  "friend_request_code_id"
    t.integer  "sender_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",                   :default => false
  end

  create_table "one_time_tokens", :force => true do |t|
    t.integer  "family_id"
    t.string   "token"
    t.datetime "expiration"
    t.string   "type"
    t.integer  "family_requested_to_id"
  end

  add_index "one_time_tokens", ["token"], :name => "index_one_time_tokens_on_token", :unique => true

  create_table "pathsteps", :force => true do |t|
    t.integer  "pathtrack_id"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pathtracks", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    :null => false
  end

  create_table "pathtracks_users", :force => true do |t|
    t.integer "pathtrack_id"
    t.integer "user_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "photo_id",                          :null => false
    t.string   "name",                              :null => false
    t.string   "mail_address",                      :null => false
    t.string   "password_hashed",                   :null => false
    t.string   "description"
    t.string   "address",                           :null => false
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "family_id"
    t.string   "sex",               :default => "", :null => false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  add_index "users", ["mail_address"], :name => "index_users_on_mail_address", :unique => true

end
