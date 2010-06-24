require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "make" do
    p = Post.make
    assert p.valid?
  end

end
