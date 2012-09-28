require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = Person.create! { |p| p.username = 'test' }
  end

  test 'show' do
    get :show, username: @person.username
    assert_response :ok
  end

  test 'show js' do
    get :show, format: :js, username: @person.username
    assert_response :ok
  end
end
