class BackfillVideosFirstPerson < ActiveRecord::Migration
  def up
    Favorite.find_each { |f| f.update_video_first_person }
  end
end
