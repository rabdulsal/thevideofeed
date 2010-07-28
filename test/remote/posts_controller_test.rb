require File.dirname(__FILE__) + '/../test_helper'

class PostsControllerTest < ActionController::TestCase

  # ===
  # NOTE these are real remote requests that can be run with "rake test:remote" - they won't be run with autotest
  # ===

  test "create" do
    sign_in!
    assert_difference 'Post.count' do
      post :create, :post => { :url => "http://www.youtube.com/watch?v=oHg5SJYRHA0" }
      assert_redirected_to root_path
    end
  end

  test "create not logged in" do
    assert_no_difference 'Post.count' do
      post :create, :post => { :url => "http://www.youtube.com/watch?v=oHg5SJYRHA0" }
      assert_redirected_to new_user_session_path
    end
  end

  test "create with invalid url" do
    sign_in!
    assert_no_difference 'Post.count' do
      post :create, :post => { :url => "http://www.youtube.com/" }
      assert_template :new
    end
  end

  test "create with photo url" do
    sign_in!
    assert_no_difference 'Post.count' do
      post :create, :post => { :url => "http://www.flickr.com/photos/hartsell/4624147095/" }
      assert_template :new
    end
  end

end