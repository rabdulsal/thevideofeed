class VideosController < ApplicationController
  def index
    @videos = Video.page(params[:page]).per_page(3)
  end
end
