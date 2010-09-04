class MoreStuffInFeedItems < ActiveRecord::Migration
  def self.up

    remove_column :feed_items, :post_id
    remove_column :feed_items, :poster_id

    add_column :feed_items, :post_id, :integer
    add_column :feed_items, :poster_id, :integer
    add_column :feed_items, :video_id, :integer

    add_index :feed_items, [:user_id, :post_created_at]
    add_index :posts, [:user_id, :created_at]
    add_index :posts, [:video_id, :created_at]
    add_index :videos, :created_at

  end

  def self.down
  end
end
