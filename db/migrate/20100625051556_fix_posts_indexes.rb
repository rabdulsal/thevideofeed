class FixPostsIndexes < ActiveRecord::Migration
  def self.up
    remove_index :posts, :user_id
    remove_index :posts, :video_id
    add_index :posts, :user_id
    add_index :posts, :video_id
  end

  def self.down
    remove_index :posts, :user_id
    remove_index :posts, :video_id
    add_index :posts, :user_id, :unique => true
    add_index :posts, :video_id, :unique => true
  end
end
