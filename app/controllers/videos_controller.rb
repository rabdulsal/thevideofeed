class VideosController < ApplicationController
  def index
    @videos = Video.order("created_at desc").page(params[:page]).per_page(4)
  end
end
