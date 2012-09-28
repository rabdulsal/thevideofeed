class Emailer
  class << self
    def perform
      videos = Video.where('created_at > ?', 1.day.ago)

      # Subscriber.all.each do |subscriber|

        SubscriptionMailer.subscription(Subscriber.first, videos).deliver
      end
    end
end
