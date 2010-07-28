require 'test_helper'

class DeviseTest < ActionDispatch::IntegrationTest

  test "custom views" do
    get new_user_session_path
    assert_response :success
    get new_user_password_path
    assert_response :success
    get edit_user_password_path
    assert_response :success
    open_session do |s|
      u = User.make(:password => 'test', :password_confirmation => 'test')
      s.post user_session_path, :email => u.email, :password => 'test'
      s.get destroy_user_session_path
      assert_response :success
    end
  end

end
