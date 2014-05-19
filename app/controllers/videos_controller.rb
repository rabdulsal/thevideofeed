class VideosController < ApplicationController
  def index
    @videos = Video.order("created_at desc").includes(:first_person).page(params[:page]).per_page(Video::PER_PAGE)

    respond_to do |format|
      format.html
      format.json { render json: @videos }
    end
  end
end
