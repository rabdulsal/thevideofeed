require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  # test "show" do
  #   get :show, :id => u.username
  #   assert_response :success
  # end

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

end
