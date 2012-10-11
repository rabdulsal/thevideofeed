require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "requires unique username" do
    assert Person.new.invalid?
    assert Person.create(youtube_username: 'name').valid?
    assert Person.new(youtube_username: 'name').invalid?
  end
end
