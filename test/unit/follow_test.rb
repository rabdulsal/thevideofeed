require 'test_helper'

class FollowTest < ActiveSupport::TestCase

  test "Follow.make" do
    assert_difference 'Follow.count' do
      Follow.make
    end
  end

  test "requires follower_id, following_id" do
    assert_no_difference 'Follow.count' do
      r = Follow.create
      assert r.errors[:following_id]
      assert r.errors[:follower_id]
    end
  end

  test "following a user backfills the follower's feed with the followed user's posts" do
    user_being_followed = User.make
    user_doing_the_following = User.make
    Time.stubs(:now).returns Time.local(2009,9,1)
    p = Post.make(:user => user_being_followed)
    assert_equal [p.id], user_being_followed.posts.map(&:id)
    assert_equal [], user_doing_the_following.feed_items
    assert_difference 'FeedItem.count' do
      assert_difference 'user_being_followed.followers_count' do
        assert_difference 'user_doing_the_following.followings_count' do
          user_doing_the_following.follow(user_being_followed)
          user_being_followed.reload
          user_doing_the_following.reload
        end
      end
    end
    user_doing_the_following.reload
    assert_equal [p.id], user_doing_the_following.feed_items.map(&:post_id)
  end

end
