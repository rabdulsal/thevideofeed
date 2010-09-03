require 'test_helper'

class PostTest < ActiveSupport::TestCase

  setup do
    Embedly.stubs(:get_attrs).returns EMBEDLY_VIDEO_ATTRS
  end

  test "make" do
    p = Post.make
    assert p.valid?
  end

end
