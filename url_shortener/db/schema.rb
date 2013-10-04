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

ActiveRecord::Schema.define(:version => 20131002215355) do

  create_table "shortened_urls", :force => true do |t|
    t.string   "long_url",     :null => false
    t.string   "short_url",    :null => false
    t.integer  "submitter_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "shortened_urls", ["short_url"], :name => "index_shortened_urls_on_short_url", :unique => true
  add_index "shortened_urls", ["submitter_id"], :name => "index_shortened_urls_on_submitter_id"

  create_table "tag_topics", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tag_topics", ["name"], :name => "index_tag_topics_on_name", :unique => true

  create_table "taggings", :force => true do |t|
    t.integer  "tag_topic_id",  :null => false
    t.integer  "tagged_url_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "taggings", ["tag_topic_id", "tagged_url_id"], :name => "index_taggings_on_tag_topic_id_and_tagged_url_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "visits", :force => true do |t|
    t.integer  "visited_url_id", :null => false
    t.integer  "visitor_id",     :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "visits", ["visited_url_id", "visitor_id"], :name => "index_visits_on_visited_url_id_and_visitor_id"

end
