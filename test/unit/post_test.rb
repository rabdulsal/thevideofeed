require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "make" do
    p = Post.make
    assert p.valid?
  end

  test "is not valid without a user_id" do
    p = Post.new
    assert_equal false, p.valid?
    assert p.errors[:user_id]
  end

  test "create" do
    u = User.make
    Embedly.expects(:get_attrs).times(1).returns TEST_URL_1_ATTRS
    assert_difference 'Post.count' do
      assert_difference 'u.posts_count' do
        u.posts.create!(:url => TEST_URL_1)
        u.reload
      end
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
