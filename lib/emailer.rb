class Emailer
  class << self
    def perform(time = Time.now.utc)
      deliver_daily
      deliver_weekly if time.friday?
    end

    private
      def deliver_daily
        videos = Video.where('created_at > ?', 1.day.ago.utc)
        subscribers = Subscriber.where(daily: true)
        deliver(videos, subscribers)
      end

      def deliver_weekly
        videos = Video.where('created_at > ?', 1.week.ago.utc)
        subscribers = Subscriber.where(daily: false)
        deliver(videos, subscribers)
      end

      def deliver(videos, subscribers)
        if videos.any?
          subscribers.each do |subscriber|
            SubscriptionMailer.subscription(subscriber, videos).deliver
          end
        end
      end
  end
end
