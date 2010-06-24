class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.integer :user_id
      t.integer :video_id
      t.timestamps
    end

    add_index :posts, :user_id, :unique => true
    add_index :posts, :video_id, :unique => true
  end

  def self.down
    drop_table :posts
  end
end
