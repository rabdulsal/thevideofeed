require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "requires unique name" do
    assert Person.new.invalid?
    assert Person.create(name: 'test', youtube_username: 'test').valid?
    assert Person.new(name: 'test', youtube_username: 'test').invalid?
  end
end
