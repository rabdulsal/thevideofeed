require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "new post" do
    assert Post.new
  end
end
