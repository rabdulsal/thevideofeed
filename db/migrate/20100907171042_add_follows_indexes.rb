class AddFollowsIndexes < ActiveRecord::Migration
  def self.up
    add_index :follows, [:follower_id, :created_at]
    add_index :follows, [:following_id, :created_at]
  end

  def self.down
  end
end
