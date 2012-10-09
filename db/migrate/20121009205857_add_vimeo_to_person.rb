class AddVimeoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :vimeo_username, :string

    # ugh, can't rename column in SQLite
    # add_column :people, :youtube_username, :string
    # copy data

    remove_index :people, :username
    remove_column :people, :username
  end
end
