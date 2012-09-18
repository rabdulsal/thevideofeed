require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "new person" do
    assert Person.new
  end
end
