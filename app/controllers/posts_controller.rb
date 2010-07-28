class PostsController < ApplicationController

  before_filter :authenticate_user!

  def new
  end

  def create
    @post = current_user.posts.new :url => params[:post][:url]
    if @post.save
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

end
