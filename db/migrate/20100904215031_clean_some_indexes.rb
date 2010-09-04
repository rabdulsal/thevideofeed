class CleanSomeIndexes < ActiveRecord::Migration
  def self.up
    
    remove_index :posts, :column => [:user_id]
    remove_index :posts, :column => [:video_id]
        
  end

  def self.down
  end
end
