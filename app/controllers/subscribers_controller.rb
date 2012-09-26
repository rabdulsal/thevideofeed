class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.create(params[:subscriber])
    redirect_to(root_path, :notice => 'Thanks for signing up!')
  end
end