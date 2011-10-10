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

ActiveRecord::Schema.define(:version => 20111010054710) do

  create_table "apps", :force => true do |t|
    t.string   "app_id",                           :null => false
    t.string   "app_secret",                       :null => false
    t.boolean  "meta",          :default => false
    t.text     "private_attrs"
    t.text     "public_attrs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apps", ["app_id"], :name => "index_apps_on_app_id", :unique => true

  create_table "content_pages", :force => true do |t|
    t.integer  "content_id"
    t.string   "name"
    t.text     "text"
    t.integer  "format",     :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_pages", ["content_id", "name"], :name => "index_content_pages_on_content_id_and_name", :unique => true

  create_table "contents", :force => true do |t|
    t.integer  "ownable_id"
    t.string   "ownable_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["ownable_id", "ownable_type"], :name => "index_contents_on_ownable_id_and_ownable_type", :unique => true

  create_table "page_apps", :force => true do |t|
    t.integer  "page_id"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_apps", ["page_id", "app_id"], :name => "index_page_apps_on_page_id_and_app_id", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "facebook_user_id", :null => false
    t.text     "facebook_profile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["facebook_user_id"], :name => "index_users_on_facebook_user_id", :unique => true

end
