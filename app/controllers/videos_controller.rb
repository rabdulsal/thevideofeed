class VideosController < ApplicationController

  def index
    @videos = Video.get :page => params[:page]
    render @videos if request.xhr?
  end

  def show
    @video = Video.find params[:id]
  end

end
