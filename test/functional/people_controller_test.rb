require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = Person.create! name: 'test', youtube_username: 'test'
  end

  test 'show' do
    get :show, id: @person.id
    assert_response :ok
  end

  test 'show js' do
    get :show, format: :js, id: @person.id
    assert_response :ok
  end
end
