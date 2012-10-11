class AddYoutubeThumbUrls < ActiveRecord::Migration
  def up
    Video.find_each do |video|
      video.update_attributes! thumbnail_url: "http://i.ytimg.com/vi/#{video.key}/mqdefault.jpg"
    end
  end
end
