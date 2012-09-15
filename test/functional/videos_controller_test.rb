require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  test 'index' do
    get :index
    assert_response :ok
  end
end
