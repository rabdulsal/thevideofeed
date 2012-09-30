require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "requires unique username" do
    assert Person.new.invalid?
    assert Person.create(username: 'name').valid?
    assert Person.new(username: 'name').invalid?
  end
end
