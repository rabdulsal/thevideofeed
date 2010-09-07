class AddPostsCountToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :posts_count, :integer, :default => 0
  end

  def self.down
  end
end
