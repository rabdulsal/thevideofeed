module VideosHelper
  def video_embed(video)
    if video.source == "youtube"
      "http://www.youtube.com/embed/#{video.key}?&autoplay=1&hd=1"
    elsif video.source == "vimeo"
      "http://player.vimeo.com/video/#{video.key}?autoplay=1"
    end
  end

  def video_link(video)
    if video.source == "youtube"
      "http://www.youtube.com/watch?v=#{video.key}"
    elsif video.source == "vimeo"
      "http://vimeo.com/#{video.key}"
    end
  end
end
