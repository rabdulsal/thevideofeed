class UsersController < ApplicationController

  before_filter :authenticate_user!, :only => [:follow, :unfollow]

  def show
    @user = User.find_by_username! params[:id]
    @posts = @user.posts.get :page => params[:page], :include => :video
    render @posts if request.xhr?
  end

  def new
  end

  def create
    @user = User.new params[:user]
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def follow
    @user = User.find_by_login! params[:id]
    current_user.follow @user
    redirect_to @user
  end

  def unfollow
    @user = User.find_by_login! params[:id]
    current_user.unfollow @user
    redirect_to @user
  end

end
