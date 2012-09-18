class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :video_id
      t.integer :person_id
      t.timestamps
    end

    add_index :posts, :video_id
    add_index :posts, :person_id
  end
end
