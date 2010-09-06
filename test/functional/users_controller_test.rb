require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "show" do
    u1 = User.make
    get :show, :id => u1.username
    assert_response :success
    # signed in
    u2 = sign_in!
    get :show, :id => u1.username
    assert_response :success
    # following
    u2.follow u1
    get :show, :id => u1.username
    assert_response :success
  end

  test "show with posts" do
    u = User.make
    Embedly.stubs(:get_attrs).returns TEST_URL_1_ATTRS
    p1 = u.posts.make(:url => TEST_URL_1)
    Embedly.stubs(:get_attrs).returns TEST_URL_2_ATTRS
    p2 = u.posts.make(:url => TEST_URL_2)
    get :show, :id => u.username
    assert_response :success
    assert_equal [p2, p1], assigns(:posts)
  end

  test "show with invalid user" do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, :id => 'invalid'
    end
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    assert_difference 'User.count' do
      post :create, :user => User.plan
      assert_redirected_to root_path
    end
  end

  test "create with invalid data" do
    assert_no_difference 'User.count' do
      assert_nothing_raised do
        post :create, :user => {:invalid => 'invalid'}
        assert_template :new
      end
    end
  end

  test "follow" do
    follower = sign_in!
    followed = User.make
    assert_difference 'Follow.count' do
      post :follow, :format => :js, :user_id => followed.username
      assert_response :success
      assert follower.following? followed
    end
  end

  test "unfollow" do
    follower = sign_in!
    followed = User.make
    follower.follow followed
    assert_difference 'Follow.count', -1 do
      post :unfollow, :format => :js, :user_id => followed.username
      assert_response :success
      assert !follower.following?(followed)
    end
  end

end
