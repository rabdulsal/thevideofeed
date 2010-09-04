class VideosController < ApplicationController

  def index
    @videos = Video.paginate(:page => params[:page], :per_page => Video::MAX_PER_PAGE)
    render @videos if request.xhr?
  end

  def show
    @video = Video.find params[:id]
  end

end
