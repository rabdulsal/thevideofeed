require File.dirname(__FILE__) + '/../test_helper'

class PostTest < ActiveSupport::TestCase

  # ===
  # NOTE these are real remote requests that can be run with "rake test:remote" - they won't be run with autotest
  # ===

  test "posts from different users with the same url creates 2 post associated with same 1 video" do
    assert_difference 'Post.count', 2 do
      assert_difference 'Video.count', 1 do
        u1 = User.make
        u2 = User.make
        p1 = u1.posts.create!(:url => "http://www.youtube.com/watch?v=oHg5SJYRHA0")
        p2 = u2.posts.create!(:url => "http://www.youtube.com/watch?v=oHg5SJYRHA0")
        assert_equal p1.video, p2.video
      end
    end
  end

  test "user can't post non-canonicalized duplicate url (youtube)" do
    assert_difference 'Post.count', 1 do
      assert_difference 'Video.count', 1 do
        u = User.make
        p1 = u.posts.create(:url => "http://www.youtube.com/watch?v=oHg5SJYRHA0")
        p2 = u.posts.create(:url => "http://youtube.com/watch?v=oHg5SJYRHA0")
        assert !p2.valid?
      end
    end
  end
  
  test "user can't post non-canonicalized duplicate url (vimeo)" do
    assert_difference 'Post.count', 1 do
      assert_difference 'Video.count', 1 do
        u = User.make
        p1 = u.posts.create(:url => "http://vimeo.com/11712103")
        p2 = u.posts.create(:url => "http://www.vimeo.com/11712103")
        assert !p2.valid?
      end
    end
  end

end