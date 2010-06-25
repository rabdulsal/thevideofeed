class UsersController < ApplicationController

  def show
    @user = User.find_by_username! params[:id]
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

  def update
    raise 'NotImplementedError'
  end

end
