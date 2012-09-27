class RemoveUnusedDbStuff < ActiveRecord::Migration
  def change
    remove_index :people, :username
    remove_index :posts, :person_id
    remove_index :posts, :video_id
    remove_index :videos, :key

    remove_column :people, :updated_at
    remove_column :posts, :updated_at
    remove_column :subscribers, :updated_at
    remove_column :videos, :updated_at
  end
end
