class FollowsFeedItemsEtc < ActiveRecord::Migration
  def self.up

    create_table "feed_items", :force => true do |t|
      t.integer  "user_id"
      t.integer  "post_id"
      t.integer  "poster_id"
      t.datetime "post_created_at"
    end

    create_table "follows", :force => true do |t|
      t.integer  "follower_id"
      t.integer  "following_id"
      t.datetime "created_at"
    end

    add_column :users, :posts_count, :integer, :default => 0
    add_column :users, :followings_count, :integer, :default => 0
    add_column :users, :followers_count, :integer, :default => 0

  end

  def self.down
  end
end
