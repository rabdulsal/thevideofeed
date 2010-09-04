class HomeController < ApplicationController

  def index
    if user_signed_in?
      redirect_to feed_path
    else
      redirect_to videos_path
    end
  end

end
