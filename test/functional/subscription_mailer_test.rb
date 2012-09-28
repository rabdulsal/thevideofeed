require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  test "generates email" do
    subscriber = Subscriber.create! email: 'test@example.com'
    videos = [ Video.create!(key: 'test') ]

    email = SubscriptionMailer.subscription(subscriber, videos)
    assert email.is_a?(Mail::Message)
  end
end
