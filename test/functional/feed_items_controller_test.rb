require 'test_helper'

class FeedItemsControllerTest < ActionController::TestCase

  # TODO tests
  # test "index" do
  #   get :index
  #   assert_redirected_to new_user_session_path(:unauthenticated => true)
  #   u = sign_in!
  #   get :index
  #   assert_response :success
  #   Post.make
  #   u.posts.make
  #   get :index
  #   assert_response :success
  # end
  #
  # test "index shows posts in user's feed_items" do
  #   u1 = sign_in!
  #   u2 = User.make
  #   p = u2.posts.make
  #   get :index
  #   assert assigns(:feed_items).blank?
  #   u1.follow(u2)
  #   get :index
  #   assert !assigns(:feed_items).blank?
  #   assert assigns(:feed_items).first.post == p
  #   u1.unfollow(u2)
  #   get :index
  #   assert assigns(:feed_items).blank?
  # end
  #
  # test "rss" do
  #   u = User.make
  #   get :index, :format => 'rss' # no token
  #   assert_redirected_to new_user_session_path(:unauthenticated => true)
  #   get :index, :format => 'rss', :auth_token => '' # blank token
  #   assert_redirected_to new_user_session_path(:unauthenticated => true)
  #   get :index, :format => 'rss', :auth_token => 'invalid' # invalid token
  #   assert_redirected_to new_user_session_path(:invalid_token => true)
  #   # TODO get rss tests working somehow
  #   # get :index, :format => 'rss', :auth_token => u.authentication_token # valid token
  #   # assert_response :success
  #   # Post.make
  #   # u.posts.make
  #   # get :index, :format => 'rss', :auth_token => u.authentication_token # with content
  #   # assert_response :success
  # end

end
