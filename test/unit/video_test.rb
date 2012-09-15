require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test "new video" do
    assert Video.new.valid?
  end
end
