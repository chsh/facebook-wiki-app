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

ActiveRecord::Schema.define(:version => 20111009144133) do

  create_table "apps", :force => true do |t|
    t.string   "app_id",        :null => false
    t.string   "app_secret",    :null => false
    t.text     "private_attrs"
    t.text     "public_attrs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apps", ["app_id"], :name => "index_apps_on_app_id", :unique => true

  create_table "contents", :force => true do |t|
    t.integer  "ownable_id"
    t.string   "ownable_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contents", ["ownable_id", "ownable_type"], :name => "index_contents_on_ownable_id_and_ownable_type", :unique => true

  create_table "page_app_contents", :force => true do |t|
    t.integer  "page_app_id",   :null => false
    t.text     "content"
    t.text     "liked_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_app_contents", ["page_app_id"], :name => "index_page_app_contents_on_page_app_id"

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

  create_table "tabs", :force => true do |t|
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

  create_table "wiki_pages", :force => true do |t|
    t.integer  "wiki_id"
    t.string   "name"
    t.text     "content"
    t.boolean  "liked",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wiki_pages", ["wiki_id", "liked", "name"], :name => "index_wiki_pages_on_wiki_id_and_liked_and_name", :unique => true

  create_table "wikis", :force => true do |t|
    t.integer  "ownable_id"
    t.string   "ownable_type"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wikis", ["ownable_id", "ownable_type"], :name => "index_wikis_on_ownable_id_and_ownable_type"

end
