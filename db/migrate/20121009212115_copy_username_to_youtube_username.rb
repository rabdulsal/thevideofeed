class CopyUsernameToYoutubeUsername < ActiveRecord::Migration
  def change
    rename_column(:people, :username, :youtube_username)
  end
end
