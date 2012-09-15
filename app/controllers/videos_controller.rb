class VideosController < ApplicationController
  def index
    @videos = Video.limit(10)
  end
end
