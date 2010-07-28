require 'test_helper'

class VideosControllerTest < ActionController::TestCase

  setup do
    Embedly.stubs(:get_attrs).returns EMBEDLY_VIDEO_ATTRS
  end

  test "index" do
    get "index"
    assert_response :success
  end

  test "index with posts" do
    Post.make
    get "index"
    assert_response :success
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
