require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  setup do
    @person = Person.create! name: 'test', youtube_username: 'test'
    @person2 = Person.create! name: 'test2', youtube_username: 'test2'
  end

  test "requires video and person" do
    assert Favorite.new.invalid?
    assert Favorite.new(key: 'key', title: 'title', source: 'youtube').invalid?
    assert @person.favorites.build(key: 'key', title: 'title',source: 'youtube').valid?
  end

  test "doesn't allow two favorites for the same video by the same user" do
    @person.favorites.create!(key: 'key', title: 'title', source: 'youtube')

    assert_raise(ActiveRecord::RecordInvalid) do
      @person.favorites.create!(key: 'key', title: 'title', source: 'youtube')
    end
  end

  test "creates a new video if no one else favorited it, uses an existing video if found" do
    assert_difference('Video.count') do
      assert_difference('Favorite.count') do
        @person.favorites.create!(key: 'key', title: 'title', source: 'youtube')
      end
    end

    assert_no_difference('Video.count') do
      assert_difference('Favorite.count') do
        @person2.favorites.create!(key: 'key', title: 'title', source: 'youtube')
      end
    end
  end

  test "sets the video title" do
    @person.favorites.create!(key: 'key', title: 'title', created_at: Date.yesterday.to_time, source: 'youtube')

    assert_equal 'title', Video.last.title
  end

  test "sets first person to the first favorite creator" do
    @person.favorites.create!(key: 'key', title: 'title', created_at: Date.yesterday.to_time, source: 'youtube')

    assert_equal @person, Video.last.first_person
  end

  test "sets first person to the older favorite" do
    @person.favorites.create!(key: 'key', title: 'title', created_at: Date.yesterday.to_time, source: 'youtube')
    @person2.favorites.create!(key: 'key', title: 'title', created_at: Date.today.to_time, source: 'youtube')

    assert_equal @person, Video.last.first_person
  end

  test "sets the video created_at to the same as the favorites if creating a new video" do
    @person.favorites.create!(key: 'key', title: 'title', created_at: Date.yesterday.to_time, source: 'youtube')

    assert_equal Date.yesterday.to_time, Video.last.created_at
  end

  test "doesn't change an existing video created_at so the home page stays stable" do
    @person.favorites.create!(key: 'key', title: 'title', created_at: Date.yesterday.to_time, source: 'youtube')
    @person2.favorites.create!(key: 'key', title: 'title', created_at: Date.today.to_time, source: 'youtube')

    assert_equal Date.yesterday.to_time, Video.last.created_at
  end
end
