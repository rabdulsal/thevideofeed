class PostsController < ApplicationController

  before_filter :authenticate_user!

  def new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

end
