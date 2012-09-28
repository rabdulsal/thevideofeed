class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(params[:subscriber])

    if Subscriber.find_by_email(@subscriber.email)
      redirect_to(root_path, :notice => "You're already signed up!")
    elsif @subscriber.invalid?
      redirect_to(root_path, :notice => "The email you provided was not valid!")
    elsif @subscriber.save
      redirect_to(root_path, :notice => "Thanks for signing up!")
    else
      redirect_to(root_path, :notice => "Something went wrong!")
    end
  end

  def destroy
    Subscriber.find_by_key(params[:key]).destroy
    render text: "You have been unsubscribed!"
  end
end
