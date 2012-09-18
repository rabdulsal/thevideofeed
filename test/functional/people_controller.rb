require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  test 'show' do
    person = Person.create! { |p| p.username = 'test' }

    get :show, username: person.username
    assert_response :ok
  end
end
