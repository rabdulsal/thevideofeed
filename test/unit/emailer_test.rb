require 'test_helper'

class EmailerTest < ActiveSupport::TestCase
  setup do
    Subscriber.create! email: 'test@example.com'
    Subscriber.create! email: 'test2@example.com'

    ActionMailer::Base.deliveries.clear
  end

  test "perform sends videos created in the last 24hrs to all subscribers" do
    Video.create! key: 'key', title: 'title', source: 'youtube'
    Video.update_all first_person_id: Person.create!(name: 'test', youtube_username: 'test').id
    Emailer.perform

    assert_equal 2, ActionMailer::Base.deliveries.size
  end

  test "perform sends email to everyone on friday" do
    Subscriber.last.update_attributes! daily: false

    Video.create! key: 'key', title: 'title', source: 'youtube'
    Video.update_all first_person_id: Person.create!(name: 'test', youtube_username: 'test').id
    Emailer.perform Time.parse('2013/01/04') # Friday

    assert_equal 2, ActionMailer::Base.deliveries.size
  end

  test "perform only sends email to daily subscribers on thursday" do
    Subscriber.last.update_attributes! daily: false

    Video.create! key: 'key', title: 'title', source: 'youtube'
    Video.update_all first_person_id: Person.create!(name: 'test', youtube_username: 'test').id
    Emailer.perform Time.parse('2013/01/03') # Thursday

    assert_equal 1, ActionMailer::Base.deliveries.size
  end

  test "perform does not send old videos" do
    Video.create! key: 'key', title: 'title', created_at: 2.days.ago, source: 'youtube'
    Emailer.perform

    assert_equal 0, ActionMailer::Base.deliveries.size
  end
end
