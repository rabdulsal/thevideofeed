require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "show" do
    u = User.make
    get :show, :id => u.username
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

end
