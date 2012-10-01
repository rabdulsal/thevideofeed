require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  setup do
    @person = Person.create! username: 'test'
    @person2 = Person.create! username: 'test2'
  end

  test "requires video and person" do
    assert Favorite.new.invalid?
    assert Favorite.new(key: 'key').invalid?
    assert @person.favorites.build(key: 'key').valid?
  end

  test "doesn't allow two favorites for the same video by the same user" do
    @person.favorites.create!(key: 'key')

    assert_raise(ActiveRecord::RecordInvalid) do
      @person.favorites.create!(key: 'key')
    end
  end

  test "creates a new video if no one else favorited it, uses an existing video if found" do
    assert_difference('Video.count') do
      assert_difference('Favorite.count') do
        @person.favorites.create!(key: 'key')
      end
    end

    assert_no_difference('Video.count') do
      assert_difference('Favorite.count') do
        @person2.favorites.create!(key: 'key')
      end
    end
  end

  test "sets the video created_at to the same as the favorites if creating a new video" do
    @person.favorites.create!(key: 'key', created_at: Date.yesterday.to_time)

    assert_equal Date.yesterday.to_time, Video.last.created_at
  end

  test "doesn't change an existing video created_at so the home page stays stable" do
    @person.favorites.create!(key: 'key', created_at: Date.yesterday.to_time)
    @person2.favorites.create!(key: 'key', created_at: Date.today.to_time)

    assert_equal Date.yesterday.to_time, Video.last.created_at
  end
end
