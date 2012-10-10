require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  test "generates email" do
    subscriber = Subscriber.create! email: 'test@example.com'
    videos = [ Video.create!(key: 'test', title: 'title', source: 'youtube') ]

    email = SubscriptionMailer.subscription(subscriber, videos)
    assert email.is_a?(Mail::Message)
  end
end
