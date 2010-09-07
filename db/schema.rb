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

ActiveRecord::Schema.define(:version => 20100907184531) do

  create_table "feed_items", :force => true do |t|
    t.integer  "user_id"
    t.datetime "post_created_at"
    t.integer  "post_id"
    t.integer  "poster_id"
    t.integer  "video_id"
    t.text     "post_cache"
  end

  add_index "feed_items", ["user_id", "post_created_at"], :name => "index_feed_items_on_user_id_and_post_created_at"

  create_table "follows", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "following_id"
    t.datetime "created_at"
  end

  add_index "follows", ["follower_id", "created_at"], :name => "index_follows_on_follower_id_and_created_at"
  add_index "follows", ["following_id", "created_at"], :name => "index_follows_on_following_id_and_created_at"

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "video_id"
    t.datetime "created_at"
  end

  add_index "posts", ["user_id", "created_at"], :name => "index_posts_on_user_id_and_created_at"
  add_index "posts", ["video_id", "created_at"], :name => "index_posts_on_video_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "username"
    t.integer  "posts_count",                         :default => 0
    t.integer  "followings_count",                    :default => 0
    t.integer  "followers_count",                     :default => 0
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "version"
    t.string   "title"
    t.string   "author_name"
    t.string   "author_url"
    t.string   "provider_name"
    t.string   "provider_url"
    t.integer  "cache_age"
    t.string   "thumbnail_url"
    t.integer  "thumbnail_width"
    t.integer  "thumbnail_height"
    t.text     "description"
    t.integer  "height"
    t.integer  "width"
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "posts_count",      :default => 0
  end

  add_index "videos", ["created_at"], :name => "index_videos_on_created_at"

end
