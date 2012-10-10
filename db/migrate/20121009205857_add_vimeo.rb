class AddVimeo < ActiveRecord::Migration
  def up
    # people
    rename_column :people, :username, :youtube_username
    add_column :people, :vimeo_username, :string
    # videos
    add_column :videos, :thumbnail_url, :string
    add_column :videos, :source, :string
    # add source to current vids
    Video.all.each do |video|
       video.update_attributes! source: "youtube"
    end
  end
  def down
    remove_column :videos, :source
    remove_column :videos, :thumbnail_url
    remove_column :people, :vimeo_username
    rename_column :people, :youtube_username, :username
  end
end
