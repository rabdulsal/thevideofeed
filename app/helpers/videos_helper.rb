module VideosHelper
  def video_thumb(video)
    "http://i.ytimg.com/vi/#{video.key}/mqdefault.jpg"
  end

  def video_embed(video)
    "http://www.youtube.com/embed/#{video.key}?&autoplay=1&hd=1"
  end

  def video_link(video)
    "http://www.youtube.com/watch?v=#{video.key}"
  end
end
