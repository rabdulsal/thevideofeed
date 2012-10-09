class AddVimeoToPerson < ActiveRecord::Migration
  def change
    add_column :people, :vimeo_username, :string
    #add_column :people, :youtube_username, :string
  end
end
