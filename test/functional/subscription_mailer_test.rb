require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  test "generates email" do
    subscriber = Subscriber.create! email: 'test@example.com'
    Video.create! key: 'test', title: 'title', source: 'youtube'
    Video.update_all first_person_id: Person.create!(youtube_username: 'test').id
    email = SubscriptionMailer.subscription(subscriber, Video.all)
    assert email.is_a?(Mail::Message)
  end
end
