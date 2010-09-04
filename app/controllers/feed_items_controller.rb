class FeedItemsController < ApplicationController

  before_filter :authenticate_user!

  def index
    # TODO
    # @feed_items = current_user.feed_items.all :include => {:post => :user}
    # @followings = current_user.followings :include => :user
  end

end
