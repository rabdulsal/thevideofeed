require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  test "requires video and person" do
    pending
  end

  test "doesn't allow two favorites for the same video by the same user" do
    pending
  end

  test "uses an existing video if found" do
    pending
  end

  test "creates a new video if no video found" do
    pending
  end

  test "sets the video created_at to the same as the favorites if creating a new video" do
    pending
  end

  test "doesn't change an existing video created_at so the home page stays stable" do
    pending
  end
end
