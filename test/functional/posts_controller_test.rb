require 'test_helper'

class PostsControllerTest < ActionController::TestCase

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
    post :create, :user => Post.plan
    assert_redirected_to new_user_session_path
  end

  test "create" do
    sign_in!
    assert_difference 'Post.count' do
      assert_difference 'Post.count' do
        post :create, :user => Post.plan
        assert_redirected_to root_path
      end
    end
  end

  test "create with invalid data" do
    sign_in!
    assert_no_difference 'Post.count' do
      assert_nothing_raised do

        # TODO defend against invalid urls, invalid types with regexp, etc
        # will probably also want remote tests with embedly checking

        post :create, :post => {:invalid => 'invalid'}
        assert_template :new

        post :create, :post => Post.plan(:url => 'http://invalid')
        assert_template :new
      end
    end
  end

end
