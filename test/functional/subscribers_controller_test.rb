require 'test_helper'

class SubscribersControllerTest < ActionController::TestCase
  test "subscriber is created if unique" do
    assert_difference('Subscriber.count') do
      post :create, subscriber: { email: 'text@example.com' }
    end

    assert_redirected_to root_path
  end

  test "subscriber is not created if not unique" do
    post :create, subscriber: { email: 'text@example.com' }

    assert_no_difference('Subscriber.count') do
      post :create, subscriber: { email: 'text@example.com' }
    end

    assert_redirected_to root_path
  end

  test "subscriber is not created if email is not valid" do
    assert_no_difference('Subscriber.count') do
      post :create, subscriber: { email: 'invalid' }
    end

    assert_redirected_to root_path
  end

  test "switch to weekly" do
    subscriber = Subscriber.create! email: 'test@example.com'
    assert subscriber.daily?

    get :weekly, key: subscriber.key
    assert_response :ok

    assert ! subscriber.reload.daily?
  end

  test "switch to daily" do
    subscriber = Subscriber.create! email: 'test@example.com', daily: false
    assert ! subscriber.daily?

    get :daily, key: subscriber.key
    assert_response :ok

    assert subscriber.reload.daily?
  end

  test "subscriber is destroyed if valid key provided" do
    subscriber = Subscriber.create! email: 'test@example.com'

    assert_difference('Subscriber.count', -1) do
      get :destroy, key: subscriber.key
    end

    assert_response :ok
  end

  test "404 if already destroyed" do
    subscriber = Subscriber.create! email: 'test@example.com'
    key = subscriber.key
    subscriber.destroy

    assert_raise(ActiveRecord::RecordNotFound) do
      assert_no_difference('Subscriber.count') do
        get :destroy, key: key
      end
    end
  end

  test "404 if invalid key on destroy, daily, weekly" do
    assert_raise(ActiveRecord::RecordNotFound) do
      assert_no_difference('Subscriber.count') do
        get :destroy, key: 'invalid'
      end
    end

    assert_raise(ActiveRecord::RecordNotFound) do
      get :daily, key: 'invalid'
    end

    assert_raise(ActiveRecord::RecordNotFound) do
      get :weekly, key: 'invalid'
    end
  end
end
