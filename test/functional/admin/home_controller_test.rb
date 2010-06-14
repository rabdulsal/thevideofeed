require 'test_helper'

class Admin::HomeControllerTest < ActionController::TestCase

  test "index" do
    # not authenticated
    get :index
    assert_response :unauthorized
    # authenticated
    http_authenticate!
    get :index
    assert_response :success
    # ...with a user
    User.make
    get :index
    assert_response :success
  end

end
