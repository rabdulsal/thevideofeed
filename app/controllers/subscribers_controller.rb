class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(params[:subscriber])

    if Subscriber.find_by_email(@subscriber.email)
      redirect_to(root_path, :notice => "YOU'RE ALREADY SIGNED UP.")
    elsif @subscriber.invalid?
      redirect_to(root_path, :notice => "YOUR EMAIL AIN'T VALID.")
    elsif @subscriber.save
      redirect_to(root_path, :notice => "THANKS FOR SIGNING UP.")
    else
      redirect_to(root_path, :notice => "SOMETHING WENT WRONG.")
    end
  end

  def destroy
    Subscriber.find_by_key(params[:key]).destroy
    render text: "You have been unsubscribed."
  end
end
