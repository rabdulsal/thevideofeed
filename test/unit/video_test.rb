require 'test_helper'

class VideoTest < ActiveSupport::TestCase

  setup do
    Embedly.stubs(:get_attrs).returns EMBEDLY_VIDEO_ATTRS
  end

  test "make" do
    v = Video.make
    assert v.valid?
  end

  test "to_param" do
    v = Video.make
    assert_equal "#{v.id}-#{v.to_s.parameterize}", v.to_param
  end

  test "to_s" do
    v = Video.make
    assert_equal v.title, v.to_s
  end

end
