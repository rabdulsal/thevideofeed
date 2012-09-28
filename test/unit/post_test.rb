require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "requires video and person" do
    pending
  end

  test "doesn't allow two posts for the same video by the same user" do
    pending
  end

  test "uses an existing video if found" do
    pending
  end

  test "creates a new video if no video found" do
    pending
  end

  test "sets the video's created_at to the same as the post's on create" do
    pending
  end

  test "doesn't change the video's created_at if new posts are added on either side" do
    pending
  end
end
