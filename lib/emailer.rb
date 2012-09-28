class Emailer
  class << self
    def perform
      videos = Video.where('created_at > ?', 1.day.ago)

      Subscriber.all.each do |subscriber|
        SubscriptionMailer.subscription(subscriber, videos).deliver
      end
    end
end
