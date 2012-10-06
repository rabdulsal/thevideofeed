require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test "requires a title unique key" do
    assert Video.new.invalid?
    assert Video.create(key: 'key', title: 'title').valid?
    assert Video.new(key: 'key', title: 'title').invalid?
  end
end
