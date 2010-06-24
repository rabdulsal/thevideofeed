require 'test_helper'

class VideoTest < ActiveSupport::TestCase

  test "make" do
    p = Post.make
    assert p.valid?
  end

  test "to_param" do
    v = Video.make
    assert_equal "#{v.id}-#{v.to_s.parameterize}", v.to_param
  end

  test "to_s" do
    u = User.make
    assert_equal u.username, u.to_s
  end

end
