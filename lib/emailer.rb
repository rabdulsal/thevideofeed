class Emailer
  class << self
    def perform(time = Time.now.utc)
      videos = Video.where('created_at > ?', 24.hours.ago.utc).includes(:first_person)

      if videos.any?
        Subscriber.for_delivery(time).each do |subscriber|
          SubscriptionMailer.subscription(subscriber, videos).deliver
        end
      end
    end
  end
end
