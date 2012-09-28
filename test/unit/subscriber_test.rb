require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  test "requires a valid email" do
    assert Subscriber.new.invalid?
    assert Subscriber.new(email: 'invalid').invalid?
    assert Subscriber.new(email: 'test@example.com').valid?
  end

  test "can find by key" do
    subscriber = Subscriber.create! email: 'test@example.com'
    assert_equal subscriber, Subscriber.find_by_key(subscriber.key)
  end

  test "raises not found if given invalid key" do
    assert_raise(ActiveRecord::RecordNotFound) do
      Subscriber.find_by_key('invalid')
    end
  end

  test "raises not found if valid key for missing subscription" do
    subscriber = Subscriber.create! email: 'test@example.com'
    key = subscriber.key
    subscriber.destroy

    assert_raise(ActiveRecord::RecordNotFound) do
      Subscriber.find_by_key(key)
    end
  end
end
