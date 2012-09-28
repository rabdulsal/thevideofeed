class SubscriptionMailer < ActionMailer::Base
  default from: "The Video Feed <trevorturk@gmail.com>"

  def subscription(subscriber, videos)
    @videos = videos
    mail to: subscriber.email, subject: "New videos"
  end
end
