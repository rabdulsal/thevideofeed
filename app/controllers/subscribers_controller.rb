class SubscribersController < ApplicationController  
  def create
    @subscriber = Subscriber.new(params[:subscriber])
        
    if @subscriber.save
      redirect_to(root_path, :notice => 'Thanks for signing up!')
    else
      redirect_to(root_path, :notice => 'You suck.')
    end
  end
end