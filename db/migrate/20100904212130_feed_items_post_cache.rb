class FeedItemsPostCache < ActiveRecord::Migration
  def self.up
    add_column :feed_items, :post_cache, :text
  end

  def self.down
  end
end
