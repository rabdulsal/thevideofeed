class FeedItemsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @feed_items = current_user.feed_items.get :page => params[:page]
    render @feed_items.map(&:post).map(&:video) if request.xhr?
  end

end
