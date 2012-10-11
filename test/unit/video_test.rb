require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test "requires a title, source, and unique key" do
    assert Video.new.invalid?
    assert Video.create(key: 'key', title: 'title', source: 'youtube').valid?
    assert Video.new(key: 'key', title: 'title', source: 'youtube').invalid?
    assert Video.new(key: 'key2', title: 'title').invalid?
  end
end
