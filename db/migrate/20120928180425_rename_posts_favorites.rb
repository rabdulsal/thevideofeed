class RenamePostsFavorites < ActiveRecord::Migration
  def up
    rename_table :posts, :favorites
  end

  def down
    rename_table :favorites, :posts
  end
end
