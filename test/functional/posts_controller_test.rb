require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  setup do
    Embedly.stubs(:get_attrs).returns EMBEDLY_VIDEO_ATTRS
  end

  test "new not signed in" do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "new signed in" do
    sign_in!
    get :new
    assert_response :success
  end

  test "create not signed in" do
    post :create, :url => Post.plan['url']
    assert_redirected_to new_user_session_path
  end

  test "create" do
    sign_in!
    assert_difference 'Post.count' do
      post :create, :url => Post.plan['url']
      assert_redirected_to root_path
    end
  end

end
