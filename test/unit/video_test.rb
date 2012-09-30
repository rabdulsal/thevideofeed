require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test "requires a unique key" do
    assert Video.new.invalid?
    assert Video.create(key: 'key').valid?
    assert Video.new(key: 'key').invalid?
  end
end
