require 'test_helper'

class UpdaterTest < ActiveSupport::TestCase
  test "perform updates favorites" do
    person = Person.create! name: 'trevorturk', youtube_username: 'trevorturk', vimeo_username: 'trevorturk'
    Updater.perform
    assert person.favorites.many?
  end
end
