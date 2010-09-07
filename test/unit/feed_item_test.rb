require 'test_helper'

class FeedItemTest < ActiveSupport::TestCase

  test "validates presence" do
    assert_no_difference 'FeedItem.count' do
      r = FeedItem.create
      assert r.errors[:user_id]
      assert r.errors[:post_created_at]
      assert r.errors[:post_id]
      assert r.errors[:poster_id]
      assert r.errors[:video_id]
      assert r.errors[:post_cache]
    end
  end

  test "belongs to user" do
    u = User.make
    f = FeedItem.make(:user_id => u.id)
    assert f.user == u
  end

  test "has one post" do
    f = FeedItem.make
    assert_equal f.post.id, f.post_id
  end

  test "has one poster" do
    f = FeedItem.make
    assert_equal f.post.user.id, f.poster_id
  end

  test "has one video" do
    f = FeedItem.make
    assert_equal f.post.video.id, f.video_id
  end

  test "post_created_at is created_at of post" do
    u = User.make
    assert_difference 'FeedItem.count' do
      @p = Post.make(:user => u)
    end
    f = u.feed_items.first
    assert_equal @p.created_at, f.post_created_at
  end

  test "post is added to poster's feed items" do
    assert_difference 'Post.count' do
      assert_difference 'FeedItem.count' do
        p = Post.make
        u = p.user
        assert_equal [], u.followers
        assert_equal p, u.feed_items.first.post
      end
    end
  end

  test "same post can't be added to the same user's feed twice" do
    assert_difference 'FeedItem.count' do
      Post.make
    end
    existing = FeedItem.last
    assert_no_difference 'FeedItem.count' do
      assert_nothing_raised do
        FeedItem.create { |f| f.user = existing.user; f.post = existing.post; f.poster = existing.poster; f.post_created_at = existing.post.created_at }
      end
    end
  end

  test "same video won't be added to the same user's feed twice" do
    follower = User.make
    u1 = User.make
    u2 = User.make
    p1 = Post.make(:user => u1, :url => TEST_URL_1)
    p2 = Post.make(:user => u2, :url => TEST_URL_1)
    assert_difference 'follower.feed_items.count', 1 do
      follower.follow(u1)
      follower.follow(u2)
      follower.reload
    end
  end

  test "post is added to post creator's followers' feed items" do
    poster = User.make
    follower = User.make
    follower.follow(poster)
    poster.reload
    follower.reload
    assert_difference 'Post.count' do
      assert_difference 'FeedItem.count', 2 do
        p = Post.make(:user => poster)
        assert_equal p, poster.feed_items.first.post
        assert_equal p, follower.feed_items.first.post
      end
    end
  end

end
