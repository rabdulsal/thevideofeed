require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  test 'index' do
    get :index
    assert_response :ok
  end

  test 'index js' do
    get :index, format: :js
    assert_response :ok
  end

  test 'index rss' do
    get :index, format: :rss
    assert_response :ok
  end
end
