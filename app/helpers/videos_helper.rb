module VideosHelper
  def video_thumb(video)
    if video.source == "youtube"
      "http://i.ytimg.com/vi/#{video.key}/mqdefault.jpg"
    elsif video.source == "vimeo"
      ""
    end
  end

  def video_embed(video)
    if video.source == "youtube"
      "http://www.youtube.com/embed/#{video.key}?&autoplay=1&hd=1"
    elsif video.source == "vimeo"
      "http://player.vimeo.com/video/#{video.key}"
    end
  end

  def video_link(video)
    if video.source == "youtube"
      "http://www.youtube.com/watch?v=#{video.key}"
    elsif video.source == "vimeo"
      "https://vimeo.com/#{video.key}"
    end
  end
end
