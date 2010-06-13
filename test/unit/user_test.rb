require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "make" do
    u = User.make
    assert u.valid?
  end

end
