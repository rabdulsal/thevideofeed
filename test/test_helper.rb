ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# load machinist models for Model.make
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

class ActiveSupport::TestCase

  setup do
    # reset machinist
    Sham.reset
  end

  # sign in as user, pass options if necessary -- sign_in!(:username => 'joe')
  def sign_in!(options = {})
    user = User.make(options)
    sign_in user
    user
  end

  def http_authenticate!
    @controller.stubs(:authenticate_or_request_with_http_basic).returns true
  end

end

class ActionController::TestCase
  include Devise::TestHelpers
end

# mock urls
TEST_URL = "http://www.youtube.com/watch?v=oHg5SJYRHA0"

# mock embedly attrs
EMBEDLY_VIDEO_ATTRS = {"html"=>"<object width=\"640\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/oHg5SJYRHA0&fs=1\"><param name=\"allowFullScreen\" value=\"true\"><param name=\"allowscriptaccess\" value=\"always\"><embed src=\"http://www.youtube.com/v/oHg5SJYRHA0&fs=1\" type=\"application/x-shockwave-flash\" width=\"640\" height=\"385\" allowscriptaccess=\"always\" allowfullscreen=\"true\"></embed></object>", "thumbnail_width"=>120, "author_name"=>"cotter548", "title"=>"RickRoll'D", "provider_url"=>"http://www.youtube.com/", "url"=>"http://www.youtube.com/watch?v=oHg5SJYRHA0", "provider_name"=>"YouTube", "thumbnail_height"=>90, "version"=>"1.0", "type"=>"video", "height"=>385, "thumbnail_url"=>"http://i.ytimg.com/vi/oHg5SJYRHA0/default.jpg", "description"=>"RickRoll'd\r\n\r\nHe's Back!\r\nOMG OMG OMG OVER 30 MILLION RICKROLL'd!", "author_url"=>"http://www.youtube.com/user/cotter548", "width"=>640}
EMBEDLY_PHOTO_ATTRS = {"thumbnail_width"=>100, "author_name"=>"Trevor H", "title"=>"Alembic", "provider_url"=>"http://www.flickr.com/", "url"=>"http://farm5.static.flickr.com/4054/4624147095_440182deb1.jpg", "provider_name"=>"Flickr", "thumbnail_height"=>68, "version"=>"1.0", "type"=>"photo", "height"=>"340", "thumbnail_url"=>"http://farm5.static.flickr.com/4054/4624147095_440182deb1_t.jpg", "cache_age"=>3600, "description"=>"Hey cool, this photo was on the Flickr blog and the NY Times' Bits blog.", "author_url"=>"http://www.flickr.com/photos/hartsell/", "width"=>"500"}
