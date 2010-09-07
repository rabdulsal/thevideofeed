class NoUpdatedAtForPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :updated_at
  end

  def self.down
  end
end
