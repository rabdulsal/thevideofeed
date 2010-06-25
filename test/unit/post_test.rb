require 'test_helper'

class PostTest < ActiveSupport::TestCase

  setup do
    Embedly.stubs(:get_attrs).returns EMBEDLY_VIDEO_ATTRS
  end

  test "make" do
    p = Post.make
    assert p.valid?
  end

  test "canonicalize urls" do
    final_url = "http://www.youtube.com/watch?v=oHg5SJYRHA0"
    p = Post.new(:url => "http://www.youtube.com/watch?v=oHg5SJYRHA0")
    p.canonicalize_url
    assert_equal p.url, final_url
    p = Post.new(:url => "http://youtube.com/watch?v=oHg5SJYRHA0")
    p.canonicalize_url
    assert_equal p.url, final_url
    p = Post.new(:url => "https://youtube.com/watch?v=oHg5SJYRHA0")
    p.canonicalize_url
    assert_equal p.url, final_url
    p = Post.new(:url => "youtube.com/watch?v=oHg5SJYRHA0")
    p.canonicalize_url
    assert_equal p.url, final_url
  end

end
