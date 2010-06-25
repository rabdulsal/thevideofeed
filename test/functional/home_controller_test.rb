require 'test_helper'

class HomeControllerTest < ActionController::TestCase

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

end
