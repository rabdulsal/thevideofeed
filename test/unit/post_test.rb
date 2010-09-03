require 'test_helper'

class PostTest < ActiveSupport::TestCase

  setup do
    Embedly.stubs(:get_attrs).returns EMBEDLY_VIDEO_ATTRS
  end

  test "make" do
    p = Post.make
    assert p.valid?
  end

  test "create" do
    u = User.make
    Embedly.expects(:get_attrs).times(1).returns EMBEDLY_VIDEO_ATTRS
    assert_difference 'Post.count' do
      u.posts.create!(:url => TEST_URL)
    end
  end


  test "invalid urls don't hit the embedly api" do
    u = User.make
    Embedly.expects(:get_attrs).never
    assert_no_difference 'Post.count' do
      u.posts.create(:url => 'invalid')
    end
  end

end
