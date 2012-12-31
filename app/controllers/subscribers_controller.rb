class SubscribersController < ApplicationController
  before_filter :set_subscriber, only: [ :daily, :weekly, :destroy ]

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

  def daily
    @subscriber.update_attributes! daily: true
    render text: "EMAILS SET TO DAILY."
  end

  def weekly
    @subscriber.update_attributes! daily: false
    render text: "EMAILS SET TO WEEKLY."
  end

  def destroy
    @subscriber.destroy
    render text: "UNSUBSCRIBED."
  end

  private
    def set_subscriber
      @subscriber = Subscriber.find_by_key(params[:key])
    end
end
