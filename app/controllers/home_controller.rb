class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to user_feed_path(current_user)
    else
      redirect_to videos_path
    end
  end

end
