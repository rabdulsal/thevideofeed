require 'test_helper'

class VideosControllerTest < ActionController::TestCase

  test "index" do
    get :index
    assert_response :success
    # with posts
    Embedly.stubs(:get_attrs).returns TEST_URL_1_ATTRS
    p1 = Post.make(:url => TEST_URL_1)
    Embedly.stubs(:get_attrs).returns TEST_URL_2_ATTRS
    p2 = Post.make(:url => TEST_URL_2)
    get :index
    assert_response :success
    assert_equal [p2.video, p1.video], assigns(:videos)
  end

  test "show" do
    v = Video.make
    get :show, :id => v.to_param
    assert_response :success
  end

  test "show with invalid video" do
    assert_raises ActiveRecord::RecordNotFound do
      get :show, :id => 'invalid'
    end
  end

end
